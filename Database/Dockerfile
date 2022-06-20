FROM mcr.microsoft.com/mssql/server

USER root

RUN apt-get -y update && \
        apt-get install -y curl && \
        apt-get install -y dos2unix

RUN mkdir -p /usr/init_db/init-sql-scripts
WORKDIR /usr/init_db
COPY *.sh /usr/init_db
COPY init-sql-scripts/*.sql /usr/init_db/init-sql-scripts

RUN dos2unix /usr/init_db/*
RUN dos2unix /usr/init_db/init-sql-scripts/*

RUN chmod +x /usr/init_db/entrypoint.sh
RUN chmod +x /usr/init_db/import-data.sh

ENV ACCEPT_EULA=y

USER mssql
ENTRYPOINT /bin/bash /usr/init_db/entrypoint.sh