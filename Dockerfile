FROM apache/airflow:2.5.1

USER root

RUN apt-get update \
  && apt-get install -y --no-install-recommends

USER airflow

COPY ./config/airflow.cfg /opt/airflow/airflow.cfg
COPY ./plugins /opt/airflow/plugins
COPY ./dags /data/airflow/dags

COPY requirements.txt /
RUN pip install --no-cache-dir -r /requirements.txt