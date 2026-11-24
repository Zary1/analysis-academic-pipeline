from airflow import DAG
from airflow.operators.python import PythonOperator
from airflow.operators.bash import BashOperator
from datetime import datetime
from src.extract import extract_student_por
import sys
sys.path.append('/opt/airflow')

with DAG(
    dag_id="student_pipeline",
    start_date=datetime(2026,1,1),
    schedule= None,
    catchup= False
)as dag:

    extract_task = PythonOperator(
    task_id="extract_and_load_student",
    python_callable= extract_student_por
)
    dbt_task=BashOperator(
        task_id="dbt_build",
        bash_command="/home/airflow/dbt_venv/bin/dbt build --project-dir /opt/airflow/dbt"
    )

    extract_task >> dbt_task