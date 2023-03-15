# ref https://qiita.com/c60evaporator/items/e1fd57a0263a19b629d1#%E3%82%B7%E3%83%8A%E3%83%AA%E3%82%AA3-mlflow-on-localhost-with-tracking-server

# builder for installing python packages
FROM python:3.10.6-buster as builder

# install mlflow and psycopg2
RUN pip install \
    mlflow \
    psycopg2 \
    boto3

# main image
FROM python:3.10.6-slim-buster

# copy python packages
COPY --from=builder /usr/local/lib/python3.10/site-packages /usr/local/lib/python3.10/site-packages
# copy mlflow package
COPY --from=builder /usr/local/bin/mlflow /usr/local/bin/mlflow
# copy linux packages for Postgres
COPY --from=builder /usr/lib/x86_64-linux-gnu /usr/lib/x86_64-linux-gnu
COPY --from=builder /lib/x86_64-linux-gnu /lib/x86_64-linux-gnu
# copy gunicorn package
COPY --from=builder /usr/local/bin/gunicorn /usr/local/bin/gunicorn

EXPOSE 5000

# Start mlflow server
CMD mlflow server \
    --host 0.0.0.0 \
    --port 5000 \
    --backend-store-uri ${BACKEND_STORE_URI} \
    --default-artifact-root ${DEFAULT_ARTIFACT_ROOT}