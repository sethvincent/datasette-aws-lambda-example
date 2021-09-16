FROM python:3.9.7-slim-bullseye

RUN apt-get update && \
  apt-get install -y \
  g++ \
  make \
  cmake \
  unzip \
  libcurl4-openssl-dev \
  libsqlite3-mod-spatialite

RUN pip install \
  awslambdaric \
  mangum \
  datasette \
  datasette-geojson

RUN mkdir /function
WORKDIR /function

COPY db.sqlite .
COPY app.py .
ENTRYPOINT ["/usr/local/bin/python", "-m", "awslambdaric"]
CMD ["app.handler"]
