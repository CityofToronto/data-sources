# The comparison between Next bus and CIS data pattern

#### The CIS data show the Milky way pattern in Ontario with points, and the next bus data show the web pattern with string lines at the similar area to CIS.

---

### ALL DATA
#### Next bus:

Find the start and end time of the next bus data (`ttc_shared`) for filtering the CIS data to have the data in the same period.

```sql
SELECT
	 (to_timestamp(MIN(times[1]))::timestamp AT TIME ZONE 'EST')::TIMESTAMP WITHOUT TIME ZONE AS time_minimun,
	 (to_timestamp(MAX (times[(array_length(times,1))]))::timestamp AT TIME ZONE 'EST')::TIMESTAMP WITHOUT TIME ZONE
      AS time_maximum
FROM ttc_shared.ttc_trips
```
Output:

| time_minimum              | time_maximum              |
| --------------------------|---------------------------|
| 2017-10-17 22:34:25.790152| 2017-11-24 17:11:49.63896 |


Thus, next bus data in `ttc_shared` is from Oct.17, 2017 to Nov.24, 2017.

#### CIS data:

```sql
SELECT * into dzou2.cis_1017_1124
FROM ttc.cis_2017
WHERE date(message_datetime) BETWEEN '2017-10-17' AND '2017-11-24'
```
Select the GPS points data that only recorded at the same period as the next bus data.


!['nextbus_cis_all'](gtfs/img/nextbus_cis_all.png)

---

### ROUTE 514
#### Next bus:


```sql
SELECT * FROM ttc_shared.ttc_trips
WHERE route_id = '514'
```
Select the next bus line data that only indicate they are route 514.

#### CIS data:

##### Step 1:

```sql
SELECT * INTO dzou2.cis_514_1017_1124
FROM ttc.cis_2017
WHERE route = 514 AND date(message_datetime) BETWEEN '2017-10-17' AND '2017-11-24'
```
Select the GPS points data that only indicate they are route 514.

##### Step 2:

```sql
DELETE FROM dzou2.cis_514_1017_1124 a USING (
      SELECT MIN(ctid) as ctid, message_datetime, vehicle, run, route, latitude, longitude
        FROM dzou2.cis_514_1017_1124
        GROUP BY message_datetime, vehicle, run, route, latitude, longitude HAVING COUNT(*) > 1
      ) b
      WHERE  a.message_datetime = b.message_datetime
      AND a.vehicle = b.vehicle
      AND a.run = b.run
      AND a.route = b.route
      AND a.latitude = b.latitude
      AND a.longitude = b.longitude
      AND a.ctid <> b.ctid

```
Delete the exact duplicates in the table.

##### Step 3:
Import the data tables into QGIS.

!['nextbus_cis_514'](gtfs/img/nextbus_cis_514.PNG)


---

### ROUTE 504
#### Next bus:

##### Step 1:

```sql
SELECT * FROM ttc_shared.ttc_trips
WHERE route_id = '504'
```
Select the next bus line data that only indicate they are route 504.

#### CIS data:

##### Step 1:

```sql
SELECT * into dzou2.cis_504_1017_1124
FROM ttc.cis_2017
WHERE route = 504 AND date(message_datetime) BETWEEN '2017-10-17' AND '2017-11-24'
```
Select the GPS points data that only indicate they are route 504.

##### Step 2:

```sql
DELETE FROM dzou2.cis_504_1017_1124 a USING (
      SELECT MIN(ctid) as ctid, message_datetime, vehicle, run, route, latitude, longitude
        FROM dzou2.cis_504_1017_1124
        GROUP BY message_datetime, vehicle, run, route, latitude, longitude HAVING COUNT(*) > 1
      ) b
      WHERE  a.message_datetime = b.message_datetime
      AND a.vehicle = b.vehicle
      AND a.run = b.run
      AND a.route = b.route
      AND a.latitude = b.latitude
      AND a.longitude = b.longitude
      AND a.ctid <> b.ctid

```
Delete the exact duplicates in the table.

##### Step 3:
Import the data tables into QGIS.

!['nextbus_cis_504'](gtfs/img/nextbus_cis_504.PNG)
