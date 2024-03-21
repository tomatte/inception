DOCKER = docker compose -f ./srcs/docker-compose.yml

VOLUME_DIR := $(shell grep 'VOLUME_DIR=' ./srcs/.env | cut -d '=' -f 2)

all: up

create_volume_dirs:
	mkdir -p $(VOLUME_DIR)/wordpress
	mkdir -p $(VOLUME_DIR)/mariadb

up: create_volume_dirs
	$(DOCKER) up --build


down:
	$(DOCKER) down

reload:
	$(DOCKER) up nginx --build -d

rwp:
	$(DOCKER) up wordpress --build -d

re: down up

rr: down up

clean: down

volumerm:
	sudo rm -rf $(VOLUME_DIR)

fclean: rr

wp:
	docker exec -it wordpress-42 bash

ng:
	docker exec -it nginx-42 bash

db:
	docker exec -it mariadb-42 bash