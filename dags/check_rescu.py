from airflow import DAG
from datetime import datetime, timedelta
from airflow.operators.python_operator import PythonOperator
from airflow.hooks.postgres_hook import PostgresHook
from airflow.hooks.base_hook import BaseHook
from airflow.contrib.operators.slack_webhook_operator import SlackWebhookOperator

from psycopg2 import sql
from psycopg2.extras import execute_values
from psycopg2 import connect, Error
import logging

LOGGER = logging.getLogger(__name__)
logging.basicConfig(level=logging.DEBUG)

#To connect to pgadmin bot
rescu_bot = PostgresHook("rescu_bot")
con = rescu_bot.get_conn()

date_to_pull = str(datetime.today() - timedelta(days=1))
LOGGER.debug('Pulling information for date = %s',date_to_pull)

def check_rescu(con, date_to_pull):
    with con.cursor() as cur:
        check_raw = sql.SQL('''SELECT COUNT(raw_uid) FROM rescu.raw_15min WHERE dt = {}''').format(sql.Literal(date_to_pull))
        cur.execute(check_raw)
        raw_num = cur.fetchone()[0]
        LOGGER.info('There are %s rows of raw_date for %s', raw_num, date_to_pull)

        check_volume = sql.SQL('''SELECT COUNT(volume_uid) FROM rescu.volumes_15min WHERE datetime_bin::date = {}''').format(sql.Literal(date_to_pull))
        cur.execute(check_volume)
        volume_num = cur.fetchone()[0]
        LOGGER.info('There are %s rows of volume_15min for %s', volume_num, date_to_pull)

        if raw_num == 0 or raw_num < volume_num or volume_num < 7000:
            raise Exception ('There is a PROBLEM here. There is no raw data OR raw_data is less than volume_15min OR volumes_15min is less than 7000 which is way too low')

SLACK_CONN_ID = 'slack'
def task_fail_slack_alert(context):
    slack_webhook_token = BaseHook.get_connection(SLACK_CONN_ID).password
    slack_msg = """
            :red_circle: RESCU row number is too low. 
            *Task*: {task}  
            *Dag*: {dag} 
            *Execution Time*: {exec_date}  
            *Log Url*: {log_url} 
            """.format(
            task=context.get('task_instance').task_id,
            dag=context.get('task_instance').dag_id,
            ti=context.get('task_instance'),
            exec_date=context.get('execution_date'),
            log_url=context.get('task_instance').log_url,
        )
    failed_alert = SlackWebhookOperator(
        task_id='slack_test',
        http_conn_id='slack',
        webhook_token=slack_webhook_token,
        message=slack_msg,
        username='airflow',
        )
    return failed_alert.execute(context=context)

default_args = {'owner':'rdumas',
                'depends_on_past':False,
                'start_date': datetime(2020, 4, 17),
                'email': ['raphael.dumas@toronto.ca'],
                'email_on_failure': False,
                 'email_on_success': False,
                 'retries': 0,
                 'retry_delay': timedelta(minutes=5),
                 'on_failure_callback': task_fail_slack_alert
                }

dag = DAG('rescu_check', default_args=default_args, schedule_interval='0 11 * * *', catchup=False)
# Run at 6 AM local time every day

task1 = PythonOperator(
    task_id = 'check_rescu',
    python_callable = check_rescu,
    dag=dag,
    op_args=[con, date_to_pull]
    )
