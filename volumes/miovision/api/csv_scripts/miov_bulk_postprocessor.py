import click
import psycopg2
import configparser
from psycopg2 import connect
import dateutil.parser
import traceback
import sys
import datetime
from requests import exceptions
from time import sleep
import math

# Hack to import from parent directory, so don't move this script...
import sys
sys.path.append("../")
import intersection_tmc as itmc


CONTEXT_SETTINGS = dict(
    default_map={'run_api': {'flag': 0}}
)

@click.group(context_settings=CONTEXT_SETTINGS)
def cli():
    pass

@cli.command()
@click.option('--csv', is_flag=True,
              help="If True, post-processes miovision_csv.")
@click.option('--start_date', default='2020-10-01',
              help='format is YYYY-MM-DD for start date')
@click.option('--end_date', default='2020-11-11',
              help=('format is YYYY-MM-DD for end date '
                    '& excluding the day itself'))
@click.option('--gapfinder_dt', default=30,
              help=('Number of days per block used by the gap finder.'))
@click.option('--path', default='config_miovision_csv_bot.cfg',
              help='enter the path/directory of the config.cfg file')
def run_api(csv, start_date, end_date, gapfinder_dt, path):

    CONFIG = configparser.ConfigParser()
    CONFIG.read(path)
    dbset = CONFIG['DBSETTINGS']
    conn = connect(**dbset)
    conn.autocommit = True
    itmc.logger.debug('Connected to DB')

    start_date = dateutil.parser.parse(str(start_date))
    end_date = dateutil.parser.parse(str(end_date))
    start_time = itmc.local_tz.localize(start_date)
    end_time = itmc.local_tz.localize(end_date)
    itmc.logger.info('Processing from %s to %s' %(start_time, end_time))

    gdt = datetime.timedelta(days=gapfinder_dt)

    if csv:
        itmc.logger.info('Processing CSV data')
    else:
        itmc.logger.info('Processing API data')

    try:
        aggregate_data_loop(conn, start_time, end_time, gdt, csv)
    except Exception as e:
        itmc.logger.critical(traceback.format_exc())
        sys.exit(1)


def aggregate_data(conn, start_time, end_iteration_time, csv):
    """Aggregate raw data to 15-minute bins."""

    if csv:
        sqlf = {
            'gaps': "SELECT miovision_csv.find_gaps_2020(%s::date, %s::date)",
            'tmc': ("SELECT miovision_csv.aggregate_15_min_tmc_2020"
                    "(%s::date, %s::date)"),
            'atr': ("SELECT miovision_csv.aggregate_15_min_2020"
                    "(%s::date, %s::date)"),
        }
    else:
        sqlf = {
            'gaps': "SELECT miovision_api.find_gaps(%s::date, %s::date)",
            'tmc': ("SELECT miovision_api.aggregate_15_min_tmc"
                    "(%s::date, %s::date)"),
            'atr': ("SELECT miovision_api.aggregate_15_min"
                    "(%s::date, %s::date)"),
            'rep': "SELECT miovision_api.report_dates(%s::date, %s::date)",
        }

    time_period = (start_time.date(), end_iteration_time.date())

    with conn:
        with conn.cursor() as cur:
            cur.execute(sqlf['gaps'], time_period)
            itmc.logger.info(conn.notices[-1])

    itmc.logger.info('Updated gapsize table and found '
                     'gaps exceeding allowable size from %s to %s'
                     %(start_time, end_iteration_time))

    try:
        with conn:
            with conn.cursor() as cur:
                cur.execute(sqlf['tmc'], time_period)
                itmc.logger.info('Aggregated to 15 minute bins')

                cur.execute(sqlf['atr'], time_period)
                itmc.logger.info('Completed data processing for %s',
                                 start_time)

    except psycopg2.Error as exc:
        itmc.logger.exception(exc)
        sys.exit(1)

    # miovision_api also requires we update `report_dates`.
    if not csv:
        with conn:
            with conn.cursor() as cur:
                cur.execute(sqlf['rep'], time_period)
                itmc.logger.info('report_dates done')


def dayrange(start_time, end_time, dt):
    """Generator for a sequence of regular time periods, with a shorter last
    period if dt does not divide evenly into end_time - start_time."""
    n_periods = math.ceil((end_time - start_time) / dt)
    for i in range(n_periods):
        c_start_t = start_time + i * dt
        if i + 1 == n_periods:
            yield (c_start_t, end_time)
        else:
            yield (c_start_t, c_start_t + dt)


def aggregate_data_loop(conn, start_time, end_time, gdt, csv):

    today_date = itmc.local_tz.localize(
        datetime.datetime.combine(
            datetime.date.today(), datetime.datetime.min.time()))

    with conn:
        for (c_start_t, c_end_t) in dayrange(start_time, end_time, gdt):
            # If the interval is in the future, stop processing.
            if today_date <= c_start_t:
                break
            # If the end of the interval exceeds the present day, set the end
            # to the present.
            elif today_date < c_end_t:
                c_end_t = today_date

            itmc.logger.info(
                "Aggregating dates " + c_start_t.strftime("%Y-%m-%d")
                + " - " + c_end_t.strftime("%Y-%m-%d"))

            aggregate_data(conn, c_start_t, c_end_t, csv)


if __name__ == '__main__':
    cli()
