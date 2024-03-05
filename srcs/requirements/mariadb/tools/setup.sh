#!/bin/bash

echo "[mysqld]" >> "/etc/mysql/my.cnf"
echo "skip-networking=0" >> "/etc/mysql/my.cnf"
echo "skip-bind-address" >> "/etc/mysql/my.cnf"

service mariadb start

SQL="mysql -u root -p$DB_ROOT_PASSWORD -e "

$SQL "CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE"

$SQL "CREATE USER '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD'"

$SQL "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$DB_ROOT_PASSWORD' WITH GRANT OPTION"

$SQL "GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO '$MARIADB_USER'@'localhost' IDENTIFIED BY '$MARIADB_PASSWORD'"

service mariadb stop

mariadbd