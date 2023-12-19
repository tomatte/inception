#!/bin/bash

sleep 10

wp config create --dbname=$DB_NAME --dbuser=root --dbhost=$DB_HOST --dbpass=$DB_ROOT_PASSWORD --allow-root

chown -R www-data:www-data /var/www/html/wordpress/

wp core install --url=inception.dev --title="Inception" --admin_user=dbrandao --admin_password=superhero --admin_email=dbrandao@gmail.com --allow-root

wp shell --allow-root