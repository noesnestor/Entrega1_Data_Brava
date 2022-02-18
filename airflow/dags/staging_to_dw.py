from datetime import timedelta

from airflow import DAG
from airflow.operators.bash_operator import BashOperator
from airflow.utils.dates import datetime
from airflow.utils.dates import timedelta

with DAG("staging_to_dw",start_date = datetime(2022,1,1),schedule_interval="@daily", catchup=False) as dag:
    
    dbt_run = BashOperator(
    task_id='dbt_run',
    bash_command='dbt run',
    dag=dag
    )

dbt_run