#!/usr/bin/env sh

echo 'Enable Slave by root with password ${MYSQL_ROOT_PASSWORD}'
mysql -uroot -p${MYSQL_ROOT_PASSWORD} -e "GRANT REPLICATION SLAVE ON *.* to 'root'@'%' identified by '${MYSQL_ROOT_PASSWORD}';"