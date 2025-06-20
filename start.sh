#!/bin/bash
# Initialise la DB Airflow si ce n'est pas déjà fait
airflow db migrate

# Crée un utilisateur admin si pas encore fait
airflow users create \
  --username admin \
  --password admin \
  --firstname Admin \
  --lastname User \
  --role Admin \
  --email admin@example.com

# Démarre le service demandé
exec airflow "$@"
