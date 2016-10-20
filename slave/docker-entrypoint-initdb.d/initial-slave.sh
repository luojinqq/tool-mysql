#!/usr/bin/env sh

until mysql -h${MYSQL_MASTER_HOST} -uroot -p${MYSQL_MASTER_ROOT_PASSWORD} -e "show master status\G" &> /dev/null
do
  echo "Waiting for master mysql connection..."
  sleep 5
done

echo "Initialing Slave"

export BINLOG=$(mysql -h${MYSQL_MASTER_HOST} -uroot -p${MYSQL_MASTER_ROOT_PASSWORD} -e "show master status\G" | grep "mysql-bin" |awk -F ":" '{print $2}'|sed 's/[[:space:]]//g')
export POSITION=$(mysql -h${MYSQL_MASTER_HOST} -uroot -p${MYSQL_MASTER_ROOT_PASSWORD} -e "show master status\G"|grep "Position" |awk -F ":" '{print $2}'|sed 's/[[:space:]]//g')

mysql -uroot -p${MYSQL_ROOT_PASSWORD} -e "change master to master_host='${MYSQL_MASTER_HOST}',master_user='root',master_password='${MYSQL_MASTER_ROOT_PASSWORD}',master_log_file='${BINLOG}',master_log_pos=${POSITION};"