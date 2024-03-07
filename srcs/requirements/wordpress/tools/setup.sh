#!/bin/bash

while ! mysql --user=root --host=mariadb --password=$DB_ROOT_PASSWORD -e "status" &> /dev/null ; do
    echo "Waiting for database connection..."
    sleep 5
done

if [[ ! -f /var/www/wordpress/wp-config.php ]]; then
    echo running wordpress configuration
    wp config create --dbname=$DB_NAME --dbuser=root --dbhost=$DB_HOST --dbpass=$DB_ROOT_PASSWORD --allow-root
    wp core install --url=dbrandao.42.fr --title="Inception" --admin_user=dbrandao --admin_password=superhero --admin_email=dbrandao@gmail.com --allow-root
    wp theme install inspiro --activate --allow-root
    wp plugin update --all --allow-root
    echo FINISHED WP OPERATIONS
fi

echo php-fpm start!

php-fpm7.4