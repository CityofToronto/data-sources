-- Script for creating a table of event-level variables from collisions.acc.

-- DROP MATERIALIZED VIEW collisions.events;

CREATE MATERIALIZED VIEW collisions.events
TABLESPACE pg_default
AS
    WITH valid_rows AS (
        SELECT *
        FROM collisions.acc
        WHERE "ACCDATE"::date >= '1985-01-01'::date AND "ACCDATE"::date <= current_date
    ), events_dat AS (
        SELECT a."ACCNB"::bigint accnb,
               date_part('year', a."ACCDATE"::date) accyear,
               -- Purposely not combining date and time to ensure compatibility with older queries.
               a."ACCDATE"::date accdate,
               a."ACCTIME"::time acctime,
               a."LONGITUDE" + 0.00021::double precision longitude,
               a."LATITUDE" + 0.000045::double precision latitude,
               a."STNAME1" stname1,
               a."STREETYPE1" streetype1,
               a."DIR1" dir1,
               a."STNAME2" stname2,
               a."STREETYPE2" streetype2,
               a."DIR2" dir2,
               a."STNAME3" stname3,
               a."STREETYPE3" streetype3,
               a."DIR3" dir3,
               a."ROAD_CLASS" road_class,
               upper(btrim(b.description)) location_type,
               upper(btrim(c.description)) location_class,
               upper(btrim(d.description)) collision_type,
               upper(btrim(k.description)) impact_type,
               upper(btrim(e.description)) visibility,
               upper(btrim(f.description)) light,
               upper(btrim(g.description)) road_surface_cond,
               CASE
                   WHEN btrim(a."PX") ~ '^[0-9]+$' THEN btrim(a."PX")::integer
                   ELSE NULL::integer
               END AS px,
               upper(btrim(h.description)) traffic_control,
               upper(btrim(i.description)) traffic_control_cond,
               CASE
                WHEN a."PRIVATE_PROPERTY" = 'Y' THEN True
                WHEN a."PRIVATE_PROPERTY" = 'N' THEN False
                ELSE NULL
               END on_private_property,
               -- Based on https://github.com/CityofToronto/bdit_data-sources/pull/349#issuecomment-803133700
               CASE
                   -- In the case of 2020 TPS collisions, the leading digit of
                   -- ACCNB is 0, which must be treated uniquely.
                   WHEN LEFT(a."ACCNB", 1) = '0' AND LENGTH(a."ACCNB") = 10 AND a."ACCDATE" BETWEEN '2020-01-01' AND '2020-12-31' THEN 'TPS'
                   WHEN a."ACCNB"::bigint >= 1000000000 THEN 'TPS'
                   WHEN a."ACCNB"::bigint >= 100000000 THEN 'CRC'
                   ELSE NULL
               END data_source
        FROM valid_rows a
        LEFT JOIN collision_factors.accloc b ON a."ACCLOC"::text = b.accloc
        LEFT JOIN collision_factors.loccoord c ON a."LOCCOORD"::text = c.loccoord
        LEFT JOIN collision_factors.acclass d ON a."ACCLASS"::text = d.acclass
        LEFT JOIN collision_factors.impactype k ON a."IMPACTYPE"::text = k.impactype
        LEFT JOIN collision_factors.visible e ON a."VISIBLE"::text = e.visible
        LEFT JOIN collision_factors.light f ON a."LIGHT"::text = f.light
        LEFT JOIN collision_factors.rdsfcond g ON a."RDSFCOND"::text = g.rdsfcond
        LEFT JOIN collision_factors.traffictl h ON a."TRAFFICTL"::text = h.traffictl
        LEFT JOIN collision_factors.trafctlcond i ON a."TRAFCTLCOND"::text = i.trafctlcond
    -- There's only one non-NULL description per collision event, so must select for it.
    ), events_desc AS (
        SELECT a."ACCNB"::bigint accnb,
               date_part('year', a."ACCDATE"::date) accyear,
               -- Will just retrieve the non-NULL result.
               MAX(a."DESCRIPTION") description
        FROM valid_rows a
        GROUP BY a."ACCNB"::bigint, date_part('year', a."ACCDATE"::date)
    )
    SELECT DISTINCT b.collision_no,
           a.accnb,
           a.accyear,
           a.accdate,
           a.acctime,
           a.longitude,
           a.latitude,
           ST_SetSRID(ST_MakePoint(a.longitude, a.latitude), 4326) geom,
           a.stname1,
           a.streetype1,
           a.dir1,
           a.stname2,
           a.streetype2,
           a.dir2,
           a.stname3,
           a.streetype3,
           a.dir3,
           a.road_class,
           a.location_type,
           a.location_class,
           a.collision_type,
           a.impact_type,
           a.visibility,
           a.light,
           a.road_surface_cond,
           a.px,
           a.traffic_control,
           a.traffic_control_cond,
           a.on_private_property,
           c.description,
           a.data_source
    FROM events_dat a
    JOIN collisions.collision_no b USING (accnb, accyear)
    LEFT JOIN events_desc c USING (accnb, accyear)
    ORDER BY b.collision_no
WITH DATA;

ALTER TABLE collisions.events
    OWNER TO collision_admins;

COMMENT ON MATERIALIZED VIEW collisions.events
    IS 'Event-level variables in collisions.acc.';

GRANT SELECT ON TABLE collisions.events TO bdit_humans;
GRANT SELECT ON TABLE collisions.events TO rsaunders;
GRANT SELECT ON TABLE collisions.events TO kchan;
GRANT SELECT ON TABLE collisions.events TO ksun;

CREATE INDEX collision_events_idx
    ON collisions.events USING btree
    (collision_no)
    TABLESPACE pg_default;

CREATE INDEX collision_events_gidx
    ON collisions.events USING gist
    (geom)
    TABLESPACE pg_default;
