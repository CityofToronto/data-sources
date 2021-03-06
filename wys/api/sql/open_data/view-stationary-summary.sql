-- View: open_data.wys_stationary_summary

DROP VIEW open_data.wys_stationary_summary;

CREATE OR REPLACE VIEW open_data.wys_stationary_summary
 AS
 SELECT od.sign_id,
    mon AS "month", pct_05, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95, spd_00, spd_05, spd_10, spd_15, spd_20, spd_25, spd_30, spd_35, spd_40, spd_45, spd_50, spd_55, spd_60, spd_65, spd_70, spd_75, spd_80, spd_85, spd_90, spd_95, spd_100_and_above, volume
   FROM open_data.wys_stationary_locations od
     JOIN wys.stationary_signs loc USING (sign_id)
     JOIN wys.stationary_summary agg ON loc.sign_id = agg.sign_id 
                                     AND agg.mon >= od.start_date 
                                     AND (od.end_date IS NULL OR agg.mon < od.end_date)
     
;
ALTER TABLE open_data.wys_stationary_summary
    OWNER TO rdumas;

GRANT SELECT ON TABLE open_data.wys_stationary_summary TO od_extract_svc;
GRANT ALL ON TABLE open_data.wys_stationary_summary TO rdumas;
GRANT SELECT ON TABLE open_data.wys_stationary_summary TO bdit_humans;
