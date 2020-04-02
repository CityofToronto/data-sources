"""
Pipeline to pull Watch Your Speed sign data data and put them into the wys.raw_data table using Python Operator.
A Slack notification is raised when the airflow process fails.
"""
import sys
from airflow import DAG
from datetime import datetime, timedelta
from airflow.operators.python_operator import PythonOperator
from airflow.operators.postgres_operator import PostgresOperator
from airflow.utils.trigger_rule import TriggerRule
from airflow.hooks.base_hook import BaseHook
from airflow.contrib.operators.slack_webhook_operator import SlackWebhookOperator
from airflow.hooks.postgres_hook import PostgresHook

from airflow.contrib.hooks.gcp_api_base_hook import GoogleCloudBaseHook
from googleapiclient.discovery import build
from dateutil.relativedelta import relativedelta

try:
    sys.path.append('/etc/airflow/dev_scripts/wys/api/python/')
    from wys_api import api_main
    from wys_google_sheet import read_masterlist
except:
    raise ImportError("Cannot import functions to pull watch your speed data")


SLACK_CONN_ID = 'slack'
def task_fail_slack_alert(context):
    slack_webhook_token = BaseHook.get_connection(SLACK_CONN_ID).password
    slack_msg = """
            :red_circle: WYS Api Pull Failed. 
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
        task_id='slack_alert',
        http_conn_id='slack',
        webhook_token=slack_webhook_token,
        message=slack_msg,
        username='airflow'
    )
    return failed_alert.execute(context=context)

#to get credentials to access google sheets
wys_api_hook = GoogleCloudBaseHook('vz_api_google')
cred = wys_api_hook._get_credentials()
service = build('sheets', 'v4', credentials=cred, cache_discovery=False)

#to connect to pgadmin bot
wys_postgres = PostgresHook("wys_bot")
connection = BaseHook.get_connection('wys_api_key')
api_key = connection.password

default_args = {'owner':'rdumas',
                'depends_on_past':False,
                'start_date': datetime(2020, 4, 1),
                'email': ['raphael.dumas@toronto.ca'],
                'email_on_failure': False,
                 'email_on_success': False,
                 'retries': 0,
                 'retry_delay': timedelta(minutes=5),
                 'on_failure_callback': task_fail_slack_alert
                }

dag = DAG('pull_wys',default_args=default_args, schedule_interval='0 11 * * *')
# Run at 8 AM local time every monday

with wys_postgres.get_conn() as con:
    t1 = PythonOperator(
            task_id = 'pull_wys',
            python_callable = api_main, 
            dag = dag,
            op_kwargs = {'conn':con, 'api_key':api_key}
            )
    
    t2 = PythonOperator(
            task_id = 'read_google_sheets',
            python_callable = read_masterlist,
            dag = dag,
            op_args = [con, service]
            )

mon = datetime.today().date() - relativedelta(months=1)
mon = mon.replace(day=1)

with DAG('wys_monthly_summary',default_args=default_args, schedule_interval='0 1 1 * *') as monthly_summary:
    wys_views = PostgresOperator(sql='SELECT wys.refresh_mat_views()',
                            task_id='wys_views',
                            postgres_conn_id='wys_bot',
                            autocommit=True,
                            retries = 0,
                            dag=monthly_summary)
    od_wys_view = PostgresOperator(sql='SELECT wys.refresh_od_mat_view()',
                            task_id='od_wys_view',
                            postgres_conn_id='wys_bot',
                            autocommit=True,
                            retries = 0,
                            dag=monthly_summary)
    wys_mobile_summary = PostgresOperator(sql='SELECT wys.mobile_summary_for_month(%s)',
                            task_id='wys_mobile_summary',
                            postgres_conn_id='wys_bot',
                            parameters=(mon,),
                            autocommit=True,
                            retries = 0,
                            dag=monthly_summary)
    wys_stat_summary = PostgresOperator(sql='SELECT wys.stationary_summary_for_month(%s)',
                            task_id='wys_stat_summary',
                            postgres_conn_id='wys_bot',
                            parameters=(mon,),
                            autocommit=True,
                            retries = 0,
                            dag=monthly_summary)
    wys_views >> [wys_mobile_summary, wys_stat_summary, od_wys_view]
