FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y python3 python3-pip
RUN pip3 install apache-airflow
RUN airflow db init

RUN pip3 install pandas virtualenv pytrends

RUN airflow users create \
        --username admin \
        --password admin \
        --role Admin \
        --email amdin@superhero.org \
        --firstname FN \
        --lastname LN

COPY dags root/airflow/dags

CMD airflow standalone
