CREATE OR REPLACE FUNCTION miovision_api.aggregate_15_min(
	start_date date,
	end_date date)
    RETURNS integer
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE
AS $BODY$
BEGIN
--Creates the ATR bins
    WITH transformed AS (
        SELECT     A.intersection_uid,
            A.datetime_bin,
            A.classification_uid,
            B.leg_new AS leg,
            B.dir,
            SUM(A.volume) AS volume,
            array_agg(volume_15min_mvt_uid) AS uids

        FROM miovision_api.volumes_15min_mvt A
        INNER JOIN miovision_api.movement_map B -- MVT to ATR crossover table.
        ON B.leg_old = A.leg AND B.movement_uid = A.movement_uid
        WHERE A.processed IS NULL
        AND datetime_bin >= start_date - INTERVAL '1 hour' AND datetime_bin < end_date - INTERVAL '1 hour'
        -- each day is aggregated from 23:00 the day before to 23:00 of that day
        GROUP BY A.intersection_uid, A.datetime_bin, A.classification_uid, B.leg_new, B.dir
    ),
    --Inserts the ATR bins to the ATR table
    insert_atr AS (
        INSERT INTO miovision_api.volumes_15min(intersection_uid, datetime_bin, classification_uid, leg, dir, volume)
        SELECT intersection_uid, datetime_bin, classification_uid, leg, dir, volume
        FROM transformed
        RETURNING volume_15min_uid, intersection_uid, datetime_bin, classification_uid, leg, dir)
    --Updates crossover table with new IDs
    , insert_crossover AS(
        INSERT INTO miovision_api.volumes_mvt_atr_xover (volume_15min_mvt_uid, volume_15min_uid)
        SELECT volume_15min_mvt_uid, volume_15min_uid
        FROM insert_atr A
        INNER JOIN (SELECT intersection_uid, datetime_bin, classification_uid, leg, dir, unnest(uids) AS volume_15min_mvt_uid FROM transformed) B
            ON A.intersection_uid=B.intersection_uid
            AND A.datetime_bin=B.datetime_bin
            AND A.classification_uid=B.classification_uid
            AND A.leg=B.leg
            AND A.dir=B.dir
        ORDER BY volume_15min_uid
        RETURNING volume_15min_mvt_uid
    )
    --Sets processed column to TRUE
    UPDATE miovision_api.volumes_15min_mvt a
    SET processed = TRUE
    FROM insert_crossover b
    WHERE a.volume_15min_mvt_uid=b.volume_15min_mvt_uid;

    RETURN NULL;
EXCEPTION
	WHEN unique_violation THEN
		RAISE EXCEPTION 'Attempting to aggregate data that has already been aggregated but not deleted';
		RETURN 0;
END;
$BODY$;

ALTER FUNCTION miovision_api.aggregate_15_min(date, date)
    OWNER TO miovision_admins;

GRANT EXECUTE ON FUNCTION miovision_api.aggregate_15_min(date, date) TO bdit_humans WITH GRANT OPTION;
GRANT EXECUTE ON FUNCTION miovision_api.aggregate_15_min(date, date) TO dbadmin WITH GRANT OPTION;
GRANT EXECUTE ON FUNCTION miovision_api.aggregate_15_min(date, date) TO bdit_bots;
GRANT EXECUTE ON FUNCTION miovision_api.aggregate_15_min(date, date) TO PUBLIC;
GRANT EXECUTE ON FUNCTION miovision_api.aggregate_15_min(date, date) TO bdit_humans;
GRANT EXECUTE ON FUNCTION miovision_api.aggregate_15_min(date, date) TO miovision_admins;
