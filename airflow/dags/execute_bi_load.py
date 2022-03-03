import datetime
import logging

from airflow import DAG
from airflow.hooks.postgres_hook import PostgresHook
from airflow.operators.python import PythonOperator
from airflow.operators.bash_operator import BashOperator
from airflow.providers.postgres.operators.postgres import PostgresOperator

POSTGRES_DEV_CONN_ID = "testing-heroku"
POSTGRES_STAGING_CONN_ID = "dw"

STAGING_SCHEMA_NAME = "staging"
TABLES_TO_IMPORT_FROM_DEV = ["polls_empresa", "polls_encuesta", 
"polls_opcionesrespuesta", "polls_pregunta",
"polls_respuesta", "polls_rol", "polls_rubro", "polls_tipoencuesta", "polls_tipopregunta", 
"polls_usuario", "polls_usuario_groups", "polls_usuario_user_permissions"]

# create_pet_table, populate_pet_table, get_all_pets, and get_birth_date are examples of tasks created by
# instantiating the Postgres Operator

def copy_to_staging(tables, temp_file_name):
    for table in tables:
        pg_dev_hook = PostgresHook.get_hook(POSTGRES_DEV_CONN_ID)
        pg_staging_hook = PostgresHook.get_hook(POSTGRES_STAGING_CONN_ID)

        logging.info("Exporting table: '%s' to file: '%s'", table, temp_file_name)
        pg_dev_hook.bulk_dump(table, temp_file_name)

        logging.info("Importing table: '%s' from file: '%s'", table, temp_file_name)
        pg_staging_hook.bulk_load(STAGING_SCHEMA_NAME+"."+table, temp_file_name)


with DAG(
    dag_id="execute_bi_load",
    start_date=datetime.datetime(2020, 2, 2),
    schedule_interval="@once",
    catchup=False,
) as dag:
    create_staging_tables = PostgresOperator(
        task_id="create_staging_tables",
        postgres_conn_id=POSTGRES_STAGING_CONN_ID,
        sql="sql/create_staging_tables.sql",
    )

    dev_to_staging = PythonOperator(
        task_id="dev_to_staging",
        python_callable=copy_to_staging,
        op_kwargs={
            "tables": TABLES_TO_IMPORT_FROM_DEV,
            "temp_file_name": "dump.csv"
        }
    )

    staging_to_dw = BashOperator(
        task_id='staging_to_dw',
        bash_command='cd /opt/airflow/dbt && dbt run --profiles-dir .',
        dag=dag
    )

    create_staging_tables >> dev_to_staging >> staging_to_dw
    
    
    