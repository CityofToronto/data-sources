"""
Dag for counting the number of rows in table wys.mobile_sign_installations_dupes.
If a non-zero number of rows is found, the script sends an alert via a Slack
message.

"""

from datetime import datetime, timedelta
from airflow import DAG
import os
import sys
import psycopg2
from airflow import DAG
from airflow.operators.python_operator import PythonOperator
from airflow.operators.postgres_operator import PostgresOperator
from airflow.operators.check_operator import CheckOperator
from airflow.hooks.base_hook import BaseHook
from airflow.hooks.postgres_hook import PostgresHook
from airflow.contrib.operators.slack_webhook_operator import SlackWebhookOperator

#To connect to pgadmin bot
rescu_bot = PostgresHook("rescu_bot")
con = rescu_bot.get_conn()

#to connect to pgadmin bot
wys_postgres = PostgresHook("wys_bot")
connection = BaseHook.get_connection('wys_api_key')
api_key = connection.password

try:
    sys.path.append('/etc/airflow/dev_scripts/wys/api/python/')
    from wys_api import api_main
#    from wys_google_sheet import read_masterlist
except:
    raise ImportError("Cannot import functions to pull watch your speed data")

# Slack error alert
SLACK_CONN_ID = 'slack'
def task_fail_slack_alert(context):
    slack_webhook_token = BaseHook.get_connection(SLACK_CONN_ID).password

    # print this task_msg and tag these users
    task_msg = """Dag `pull_wys` failed for the following task:`
        <@UHJA7GHQV> <@U1XGLNWG2> SVP jetez un oeil :eyes: :thanks_japanese: 
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

DEFAULT_ARGS = {
    'owner': 'cnangini',
    'depends_on_past' : False,
    'email': ['Cathy.Nangini@toronto.ca'],
    'email_on_failure': True,
    'email_on_retry': True,
    'start_date': datetime(2021, 4, 28), # YYYY, MM, DD
    'retries': 0,
    'retry_delay': timedelta(minutes=5),
    'on_failure_callback': task_fail_slack_alert
}

# ------------------------------------------------------------------------------
dag = DAG(
    'check_wys_mobile_dupes',
    default_args=DEFAULT_ARGS, 
    schedule_interval='0 5 * * *', # Run at 5am local time each day 
    catchup=False
)

task1 = PythonOperator(
    task_id = 'pull_wys',
    python_callable = api_main,
    dag = dag,
    op_kwargs = {'conn':wys_postgres.get_conn(),
                 'start_date':'{{ ds }}',
                 'end_date':'{{ ds }}',
                 'api_key':api_key}
                      )

# task3 will fail when there are a non-zero number of rows in the table
# and this will trigger a slack alert message
task3 = CheckOperator(
    task_id='check_wys_mobile_dupes_id',
    sql='''SELECT COUNT(1) = 0 FROM wys.mobile_sign_installations_dupes''',
    conn_id='wys_bot',
    dag=dag
)
