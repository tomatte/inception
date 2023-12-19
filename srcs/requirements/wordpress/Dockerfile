FROM debian:oldstable

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install wget php php-curl php-fpm php-bcmath php-gd php-soap sendmail \
	php-zip php-curl php-mbstring php-mysqlnd php-gd php-xml php-intl php-zip -y

WORKDIR /var/www/html/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x ./wp-cli.phar && \
	mv ./wp-cli.phar /bin/wp

RUN wp core download --allow-root

COPY ./tools/setup.sh ./setup.sh

RUN chmod +x ./setup.sh

ENTRYPOINT [ "./setup.sh" ]

CMD ["wp", "shell", "--allow-root"]