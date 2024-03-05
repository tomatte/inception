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

wp:
	docker exec -it test-wp bash

ng:
	docker exec -it test-nginx bash