FROM debian:oldstable

WORKDIR /home/downloads

RUN apt update -y && apt upgrade -y
RUN apt install wget php php-curl php-fpm php-bcmath php-gd php-soap sendmail \
	php-zip php-curl php-mbstring php-mysqlnd php-gd php-xml php-intl php-zip \
	sudo mariadb-client -y

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x ./wp-cli.phar && mv ./wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/wordpress

RUN wp core download --allow-root

COPY ./setup.sh /home/tools/setup.sh

RUN chmod +x /home/tools/setup.sh

# crete inter proccess communication file
RUN mkdir -p /run/php && touch /run/php/php7.4-fpm.sock && chmod 666 /run/php/php7.4-fpm.sock

#configure php-fpm
RUN sed -Ei 's/;listen\.mode = .+/listen\.mode = 0660/' /etc/php/7.4/fpm/pool.d/www.conf && \
	sed -Ei 's/;daemonize = yes/daemonize = no/' /etc/php/7.4/fpm/php-fpm.conf

ENTRYPOINT [ "/home/tools/setup.sh" ]