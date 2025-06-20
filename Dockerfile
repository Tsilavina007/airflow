FROM apache/airflow:3.0.2

USER airflow

COPY requirements.txt /requirements.txt
RUN pip install --no-cache-dir -r /requirements.txt

COPY start.sh /start.sh
RUN chmod +x /start.sh

ENTRYPOINT ["/start.sh"]

ENTRYPOINT ["airflow"]
CMD ["api-server"]
