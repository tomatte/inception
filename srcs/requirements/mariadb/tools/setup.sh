#!/bin/bash

service mariadb start

SQL="mysql -u root -p$DB_ROOT_PASSWORD -e "

$SQL "CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE"
$SQL "GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO '$MARIADB_USER'@'localhost' IDENTIFIED BY '$MARIADB_PASSWORD'"

service mariadb stop

mariadbd