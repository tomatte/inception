DOCKER = docker compose -f ./srcs/docker-compose.yml

volume_dir := $(shell grep 'VOLUME_DIR=' ./srcs/.env | cut -d '=' -f 2)

create_volume_dirs:
	mkdir -p $(volume_dir)/wordpress
	mkdir -p $(volume_dir)/mariadb

up:
	$(DOCKER) up

build: create_volume_dirs
	$(DOCKER) up --build

all: up

down:
	$(DOCKER) down

re: down up

rr: down build

clean: down
fclean: rr

wp:
	docker exec -it wordpress-42 bash

ng:
	docker exec -it nginx-42 bash

db:
	docker exec -it mariadb-42 bash