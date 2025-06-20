FROM apache/airflow:3.0.2

USER airflow

COPY requirements.txt /requirements.txt
RUN pip install --no-cache-dir -r /requirements.txt

USER root

COPY start.sh /start.sh
RUN chmod +x /start.sh

USER airflow

ENTRYPOINT ["./start.sh"]
# ENTRYPOINT ["airflow"]
# CMD ["api-server"]
