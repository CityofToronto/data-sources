CREATE OR REPLACE FUNCTION here.ta_insert_trigger()
RETURNS TRIGGER AS $$
BEGIN 

	IF (NEW.tx >= DATE '2020-12-01' AND NEW.tx < DATE '2020-12-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_202012(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2020-11-01' AND NEW.tx < DATE '2020-11-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_202011(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2020-10-01' AND NEW.tx < DATE '2020-10-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_202010(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2020-09-01' AND NEW.tx < DATE '2020-09-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_202009(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2020-08-01' AND NEW.tx < DATE '2020-08-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_202008(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2020-07-01' AND NEW.tx < DATE '2020-07-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_202007(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2020-06-01' AND NEW.tx < DATE '2020-06-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_202006(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2020-05-01' AND NEW.tx < DATE '2020-05-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_202005(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2020-04-01' AND NEW.tx < DATE '2020-04-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_202004(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2020-03-01' AND NEW.tx < DATE '2020-03-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_202003(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2020-02-01' AND NEW.tx < DATE '2020-02-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_202002(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2020-01-01' AND NEW.tx < DATE '2020-01-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_202001(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2019-12-01' AND NEW.tx < DATE '2019-12-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201912(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2019-11-01' AND NEW.tx < DATE '2019-11-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201911(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2019-10-01' AND NEW.tx < DATE '2019-10-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201910(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2019-09-01' AND NEW.tx < DATE '2019-09-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201909(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2019-08-01' AND NEW.tx < DATE '2019-08-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201908(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2019-07-01' AND NEW.tx < DATE '2019-07-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201907(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2019-06-01' AND NEW.tx < DATE '2019-06-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201906(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2019-05-01' AND NEW.tx < DATE '2019-05-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201905(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2019-04-01' AND NEW.tx < DATE '2019-04-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201904(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2019-03-01' AND NEW.tx < DATE '2019-03-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201903(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2019-02-01' AND NEW.tx < DATE '2019-02-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201902(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2019-01-01' AND NEW.tx < DATE '2019-01-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201901(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2018-12-01' AND NEW.tx < DATE '2018-12-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201812(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2018-11-01' AND NEW.tx < DATE '2018-11-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201811(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2018-10-01' AND NEW.tx < DATE '2018-10-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201810(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2018-09-01' AND NEW.tx < DATE '2018-09-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201809(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2018-08-01' AND NEW.tx < DATE '2018-08-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201808(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2018-07-01' AND NEW.tx < DATE '2018-07-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201807(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2018-06-01' AND NEW.tx < DATE '2018-06-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201806(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2018-05-01' AND NEW.tx < DATE '2018-05-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201805(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2018-04-01' AND NEW.tx < DATE '2018-04-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201804(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2018-03-01' AND NEW.tx < DATE '2018-03-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201803(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2018-02-01' AND NEW.tx < DATE '2018-02-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201802(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2018-01-01' AND NEW.tx < DATE '2018-01-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201801(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2017-12-01' AND NEW.tx < DATE '2017-12-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201712(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2017-11-01' AND NEW.tx < DATE '2017-11-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201711(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2017-10-01' AND NEW.tx < DATE '2017-10-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201710(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2017-09-01' AND NEW.tx < DATE '2017-09-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201709(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2017-08-01' AND NEW.tx < DATE '2017-08-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201708(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2017-07-01' AND NEW.tx < DATE '2017-07-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201707(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2017-06-01' AND NEW.tx < DATE '2017-06-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201706(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2017-05-01' AND NEW.tx < DATE '2017-05-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201705(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2017-04-01' AND NEW.tx < DATE '2017-04-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201704(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2017-03-01' AND NEW.tx < DATE '2017-03-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201703(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2017-02-01' AND NEW.tx < DATE '2017-02-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201702(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2017-01-01' AND NEW.tx < DATE '2017-01-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201701(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2016-12-01' AND NEW.tx < DATE '2016-12-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201612(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2016-11-01' AND NEW.tx < DATE '2016-11-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201611(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2016-10-01' AND NEW.tx < DATE '2016-10-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201610(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2016-09-01' AND NEW.tx < DATE '2016-09-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201609(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2016-08-01' AND NEW.tx < DATE '2016-08-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201608(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2016-07-01' AND NEW.tx < DATE '2016-07-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201607(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2016-06-01' AND NEW.tx < DATE '2016-06-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201606(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2016-05-01' AND NEW.tx < DATE '2016-05-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201605(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2016-04-01' AND NEW.tx < DATE '2016-04-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201604(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2016-03-01' AND NEW.tx < DATE '2016-03-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201603(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2016-02-01' AND NEW.tx < DATE '2016-02-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201602(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2016-01-01' AND NEW.tx < DATE '2016-01-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201601(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2015-12-01' AND NEW.tx < DATE '2015-12-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201512(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2015-11-01' AND NEW.tx < DATE '2015-11-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201511(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2015-10-01' AND NEW.tx < DATE '2015-10-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201510(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2015-09-01' AND NEW.tx < DATE '2015-09-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201509(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2015-08-01' AND NEW.tx < DATE '2015-08-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201508(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2015-07-01' AND NEW.tx < DATE '2015-07-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201507(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2015-06-01' AND NEW.tx < DATE '2015-06-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201506(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2015-05-01' AND NEW.tx < DATE '2015-05-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201505(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2015-04-01' AND NEW.tx < DATE '2015-04-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201504(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2015-03-01' AND NEW.tx < DATE '2015-03-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201503(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2015-02-01' AND NEW.tx < DATE '2015-02-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201502(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2015-01-01' AND NEW.tx < DATE '2015-01-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201501(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2014-12-01' AND NEW.tx < DATE '2014-12-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201412(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2014-11-01' AND NEW.tx < DATE '2014-11-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201411(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2014-10-01' AND NEW.tx < DATE '2014-10-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201410(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2014-09-01' AND NEW.tx < DATE '2014-09-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201409(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2014-08-01' AND NEW.tx < DATE '2014-08-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201408(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2014-07-01' AND NEW.tx < DATE '2014-07-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201407(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2014-06-01' AND NEW.tx < DATE '2014-06-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201406(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2014-05-01' AND NEW.tx < DATE '2014-05-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201405(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2014-04-01' AND NEW.tx < DATE '2014-04-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201404(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2014-03-01' AND NEW.tx < DATE '2014-03-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201403(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2014-02-01' AND NEW.tx < DATE '2014-02-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201402(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2014-01-01' AND NEW.tx < DATE '2014-01-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201401(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2013-12-01' AND NEW.tx < DATE '2013-12-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201312(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2013-11-01' AND NEW.tx < DATE '2013-11-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201311(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2013-10-01' AND NEW.tx < DATE '2013-10-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201310(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2013-09-01' AND NEW.tx < DATE '2013-09-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201309(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2013-08-01' AND NEW.tx < DATE '2013-08-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201308(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2013-07-01' AND NEW.tx < DATE '2013-07-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201307(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2013-06-01' AND NEW.tx < DATE '2013-06-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201306(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2013-05-01' AND NEW.tx < DATE '2013-05-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201305(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2013-04-01' AND NEW.tx < DATE '2013-04-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201304(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2013-03-01' AND NEW.tx < DATE '2013-03-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201303(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2013-02-01' AND NEW.tx < DATE '2013-02-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201302(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2013-01-01' AND NEW.tx < DATE '2013-01-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201301(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2012-12-01' AND NEW.tx < DATE '2012-12-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201212(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2012-11-01' AND NEW.tx < DATE '2012-11-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201211(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2012-10-01' AND NEW.tx < DATE '2012-10-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201210(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2012-09-01' AND NEW.tx < DATE '2012-09-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201209(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2012-08-01' AND NEW.tx < DATE '2012-08-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201208(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2012-07-01' AND NEW.tx < DATE '2012-07-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201207(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2012-06-01' AND NEW.tx < DATE '2012-06-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201206(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2012-05-01' AND NEW.tx < DATE '2012-05-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201205(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2012-04-01' AND NEW.tx < DATE '2012-04-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201204(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2012-03-01' AND NEW.tx < DATE '2012-03-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201203(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2012-02-01' AND NEW.tx < DATE '2012-02-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201202(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSIF (NEW.tx >= DATE '2012-01-01' AND NEW.tx < DATE '2012-01-01' +INTERVAL '1 month') THEN
 INSERT INTO here.ta_201201(link_dir, tx, epoch_min, length, mean, stddev, min_spd, max_spd, confidence, pct_5, pct_10, pct_15, pct_20, pct_25, pct_30, pct_35, pct_40, pct_45, pct_50, pct_55, pct_60, pct_65, pct_70, pct_75, pct_80, pct_85, pct_90, pct_95) 
VALUES (NEW.*)ON CONFLICT DO NOTHING;
ELSE 
	RAISE EXCEPTION 'tx out of range.  Fix the ta_insert_trigger() function!';
END IF;
    RETURN NULL;
END;
$$
LANGUAGE plpgsql SECURITY DEFINER;
ALTER FUNCTION here.ta_insert_trigger() OWNER TO here_admins;
	   
DROP TRIGGER IF EXISTS insert_trigger ON here.ta;
CREATE TRIGGER insert_trigger
    BEFORE INSERT
    ON here.ta
    FOR EACH ROW
    EXECUTE PROCEDURE here.ta_insert_trigger();