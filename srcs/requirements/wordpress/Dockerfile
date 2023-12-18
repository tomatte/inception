FROM debian:oldstable

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install wget php php-curl php-fpm php-bcmath php-gd php-soap \
	php-zip php-curl php-mbstring php-mysqlnd php-gd php-xml php-intl php-zip -y

WORKDIR /var/www/html/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x ./wp-cli.phar && \
	mv ./wp-cli.phar /bin/wp

RUN wp core download --allow-root

RUN sed -E 's/database_name_here/mary/g' 'wp-config-sample.php' > 'wp-config.php' && \
	sed -iE 's/username_here/dbrandao/g' 'wp-config.php' && \
	sed -iE 's/password_here/notsecret123/g' 'wp-config.php' && \
	sed -iE 's/localhost/mariadb/g' 'wp-config.php' && \
	chown -R www-data:www-data /var/www/html/wordpress/
# RUN	wp config create --allow-root --dbname=mary --dbuser=dbrandao \
# 		--dbpass=notsecret123 --dbhost=mariadb --dbcharset="utf8" --dbcollate="utf8_general_ci"

# RUN wp core install --url=domain_name --title=WP_TITLE \
# 		--admin_user=WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD \
# 		--admin_email=WP_ADMIN_EMAIL --skip-email --allow-root

# WORKDIR /var/www/html/wordpress


CMD ["sleep", "infinity"]