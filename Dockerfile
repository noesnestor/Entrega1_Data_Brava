FROM apache/airflow:2.2.3

RUN pip install wtforms && \
    pip install 'apache-airflow[postgres]' && \
    pip install dbt && \
    pip install SQLAlchemy