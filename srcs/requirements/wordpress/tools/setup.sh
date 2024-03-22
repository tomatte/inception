#!/bin/bash
sleep 4
while ! mysql --user=root --host=mariadb --password=$DB_ROOT_PASSWORD -e "status" &> /dev/null ; do
    echo "Waiting for database connection..."
	sleep 4
done

if [[ ! -f /var/www/wordpress/wp-config.php ]]; then
    echo running wordpress configuration
    wp config create --dbname=$DB_NAME --dbuser=root --dbhost=$DB_HOST --dbpass=$DB_ROOT_PASSWORD --allow-root
    wp core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
    wp user create $WP_USER_LOGIN $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD --display_name=$WP_USER_NAME --allow-root
    wp plugin update --all --allow-root
    wp theme install inspiro --activate --allow-root
    echo FINISHED WP OPERATIONS
fi

echo php-fpm start!

php-fpm7.4