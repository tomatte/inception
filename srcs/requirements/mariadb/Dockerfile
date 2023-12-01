FROM debian:oldstable

RUN apt-get update -y && \
	apt-get install -y mariadb-server && \
	mkdir -p /run/mysqld && \
    chmod -R 777 /run/mysqld && \
	rm -rf /var/lib/apt/lists/*

CMD ["mariadbd"]