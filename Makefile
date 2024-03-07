DOCKER = docker compose -f ./srcs/docker-compose.yml

up:
	$(DOCKER) up

build:
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