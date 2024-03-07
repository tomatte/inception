FROM debian:oldstable

RUN apt update -y && apt upgrade -y

RUN apt install nginx openssl -y

RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf

COPY ./conf/default /etc/nginx/sites-available/default

RUN openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/nginx/key.key -out /etc/nginx/crt.crt -subj "/CN=dbrandao.42.fr"

RUN echo '<?php phpinfo() ?>' > /var/www/index.php && \
	echo '<html><body><h1>HELLO BITCH!!!</h1></body> </html>' > /var/www/index.html

CMD ["nginx"]

