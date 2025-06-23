FROM apache/airflow:2.9.1-python3.10

ENV AIRFLOW_HOME=/opt/airflow

USER root
RUN pip install --no-cache-dir --upgrade pip

# Copy DAGs
COPY dags/ ${AIRFLOW_HOME}/dags/

# Entry point script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Install requirements if needed
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

USER airflow
ENTRYPOINT ["/start.sh"]
