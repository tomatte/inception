FROM debian:oldstable

RUN	echo 'X-Repolib-Name: MariaDB' >> /etc/apt/sources.list.d/mariadb.sources && \
	echo 'Types: deb' >> /etc/apt/sources.list.d/mariadb.sources && \
	echo 'URIs: https://mirrors.gigenet.com/mariadb/repo/11.2/debian' >> /etc/apt/sources.list.d/mariadb.sources && \
	echo 'Suites: bullseye' >> /etc/apt/sources.list.d/mariadb.sources && \
	echo 'Components: main' >> /etc/apt/sources.list.d/mariadb.sources && \
	echo 'Signed-By: /etc/apt/keyrings/mariadb-keyring.pgp' >> /etc/apt/sources.list.d/mariadb.sources

RUN apt update && apt install -y mariadb-server

RUN apt install -y apt-transport-https curl && \
	mkdir -p /etc/apt/keyrings && \
	curl -o /etc/apt/keyrings/mariadb-keyring.pgp 'https://mariadb.org/mariadb_release_signing_key.pgp'

RUN mkdir -p /run/mysqld && chown mysql:mysql /run/mysqld

COPY ./tools/setup.sh /home/app/setup.sh

WORKDIR /home/app

RUN chmod +x /home/app/setup.sh

RUN echo 'datadir = /var/lib/mysql' >> /etc/mysql/my.conf

ENTRYPOINT [ "/home/app/setup.sh" ]