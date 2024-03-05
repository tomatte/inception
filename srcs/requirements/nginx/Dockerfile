FROM debian:oldstable

RUN apt update -y && apt upgrade -y

RUN apt install nginx -y

RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf

COPY ./conf/default /etc/nginx/sites-available/default

RUN echo '<?php phpinfo() ?>' > /var/www/index.php && \
	echo '<html><body><h1>HELLO BITCH!!!</h1></body> </html>' > /var/www/index.html

CMD ["nginx"]

