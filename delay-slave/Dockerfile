FROM mysql:5.6.30

COPY ./docker-entrypoint-initdb.d /docker-entrypoint-initdb.d
COPY ./conf.d /etc/mysql/conf.d

ENV MYSQL_MASTER_HOST mysql