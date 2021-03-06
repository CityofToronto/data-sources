CREATE OR REPLACE FUNCTION wys.refresh_mat_views()
RETURNS void
    LANGUAGE 'sql'

    COST 100
    VOLATILE SECURITY DEFINER 
AS $BODY$
    REFRESH MATERIALIZED VIEW CONCURRENTLY wys.mobile_api_id WITH DATA ;
    REFRESH MATERIALIZED VIEW CONCURRENTLY wys.stationary_signs WITH DATA ;
$BODY$;
REVOKE EXECUTE ON FUNCTION wys.refresh_mat_views()FROM public;
GRANT EXECUTE ON FUNCTION wys.refresh_mat_views()TO wys_bot;