DROP FUNCTION gis._get_intersection_geom(text, text, text, double precision, integer);
CREATE OR REPLACE FUNCTION gis._get_intersection_geom(highway2 TEXT, btwn TEXT, direction TEXT, metres FLOAT, not_int_id INT,
OUT oid_geom GEOMETRY, OUT oid_geom_translated GEOMETRY, OUT int_id_found INT, OUT lev_sum INT)

LANGUAGE 'plpgsql'
AS $BODY$

DECLARE
geom TEXT;
int_arr INT[];
oid_int INT;
oid_geom_test GEOMETRY;

BEGIN
int_arr := (CASE WHEN TRIM(highway2) = TRIM(btwn) 
	THEN (gis._get_intersection_id_highway_equals_btwn(highway2, btwn, not_int_id))
	ELSE (gis._get_intersection_id(highway2, btwn, not_int_id))
	END);

oid_int := int_arr[1];
int_id_found := int_arr[3];
lev_sum := int_arr[2];

--needed geom to be in SRID = 2952 for the translation
oid_geom_test := (
		SELECT ST_Transform(ST_SetSRID(gis.geom, 4326), 2952)
		FROM gis.centreline_intersection gis
		WHERE objectid = oid_int
		);
oid_geom_translated := (
		CASE WHEN direction IS NOT NULL OR metres IS NOT NULL
	   	THEN (SELECT *
           FROM gis._translate_intersection_point(oid_geom_test, metres, direction) translated_geom)
		ELSE NULL
		END
		);
oid_geom := (
		SELECT gis.geom 
		FROM gis.centreline_intersection gis
		WHERE objectid = oid_int
		);

RAISE NOTICE '(get_intersection_geom) oid: %, geom: %, geom_translated: %, direction %, metres %, not_int_id: %', 
oid_int, ST_AsText(oid_geom), ST_AsText(oid_geom_translated), direction, metres::TEXT, not_int_id;

END;
$BODY$;

COMMENT ON FUNCTION gis._get_intersection_geom(TEXT, TEXT, TEXT, FLOAT, INT) IS '
Input values of the names of two intersections, direction (may be NULL), number of units the intersection should be translated,
and the intersection id of an intersection that you do not want the function to return (or 0).

Returns a record of oid_geom, oid_geom_translated (if applicable lese null), int_id_found and lev_sum. 
Outputs an array of the geometry of the intersection described. 
If the direction and metres are not null, it will return the point geometry (known as oid_geom_translated),
translated by x metres in the inputted direction. It also returns (in the array) the intersection id and the objectid of the output intersection.
Additionally, the levenshein distance between the text inputs described and the output intersection name is in the output array.
';