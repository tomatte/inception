DOCKER = docker compose -f ./srcs/docker-compose.yml

VOLUME_DIR := $(shell grep 'VOLUME_DIR=' ./srcs/.env | cut -d '=' -f 2)
WP_URL := $(shell grep 'WP_URL=' ./srcs/.env | cut -d '=' -f 2)

all: up

upgrade:
	@echo upgrading packages
	@sudo apt update -y
	@sudo apt upgrade -y

setup:
	sudo mkdir -p $(VOLUME_DIR)/wordpress
	sudo mkdir -p $(VOLUME_DIR)/mariadb
	sudo echo '127.0.0.1       $(WP_URL)' >> /etc/hosts

up: setup
	$(DOCKER) up --build

down:
	$(DOCKER) down

reload:
	$(DOCKER) up nginx --build -d

rwp:
	$(DOCKER) up wordpress --build -d

rdb:
	$(DOCKER) up mariadb --build -d


re: down up

rr: down up

fclean: down
	docker volume rm inception-wp-files
	docker volume rm inception-database
	docker volume rm inception-socket-file
	sudo rm -rf $(VOLUME_DIR)

reset: fclean up

volumerm:
	sudo rm -rf $(VOLUME_DIR)

wp:
	docker exec -it wordpress-42 bash

ng:
	docker exec -it nginx-42 bash

db:
	docker exec -it mariadb-42 bash