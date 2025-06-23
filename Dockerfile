FROM apache/airflow:2.9.1-python3.10

ENV AIRFLOW_HOME=/opt/airflow

USER airflow
RUN pip install --no-cache-dir --upgrade pip

# Copy DAGs
COPY dags/ ${AIRFLOW_HOME}/dags/

USER root
# Entry point script
COPY start.sh /start.sh
RUN chmod +x /start.sh

USER airflow
# Install requirements if needed
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

ENTRYPOINT ["/start.sh"]
