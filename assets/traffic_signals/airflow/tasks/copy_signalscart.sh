SET -o pipefail; psql -U airflow -h localhost -p 5432 traffic_signals -c "COPY (SELECT * FROM public.signals_cart) TO STDOUT (FORMAT text, ENCODING 'UTF-8')" | psql $vz_pg_uri -v "ON_ERROR_STOP=1" -c "TRUNCATE vz_safety_programs_staging.signals_cart; COPY vz_safety_programs_staging.signals_cart FROM STDIN;"
