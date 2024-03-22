#!/bin/bash

echo "[mysqld]" >> "/etc/mysql/my.cnf"
echo "skip-networking=0" >> "/etc/mysql/my.cnf"
echo "skip-bind-address" >> "/etc/mysql/my.cnf"

service mariadb stop

mariadbd