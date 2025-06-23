#!/bin/bash

airflow db init
airflow users create \
    --username admin \
    --firstname Admin \
    --lastname User \
    --role Admin \
    --email admin@example.com \
    --password admin

# Lancer à la fois le scheduler et le webserver
airflow scheduler & airflow webserver
