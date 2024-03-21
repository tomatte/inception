FROM debian:oldstable

WORKDIR /home/downloads

RUN apt update -y && apt upgrade -y

RUN apt install wget php7.4 php7.4-curl php7.4-fpm php7.4-gd \
	php-mbstring php7.4-xml mariadb-client php7.4-mysql -y

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x ./wp-cli.phar && mv ./wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/wordpress

RUN wp core download --allow-root

COPY ./tools/setup.sh /home/tools/setup.sh

RUN chmod +x /home/tools/setup.sh

# crete inter proccess communication file
RUN mkdir -p /run/php && touch /run/php/php7.4-fpm.sock && chmod 666 /run/php/php7.4-fpm.sock

#configure php-fpm
RUN sed -Ei 's/;listen\.mode = .+/listen\.mode = 0660/' /etc/php/7.4/fpm/pool.d/www.conf && \
	sed -Ei 's/;daemonize = yes/daemonize = no/' /etc/php/7.4/fpm/php-fpm.conf

ENTRYPOINT [ "/home/tools/setup.sh" ]