.PHONY: 

DIR		=	./srcs

up:
	docker compose -f $(DIR)/docker-compose.yml up

all: up

build:
	docker compose -f $(DIR)/docker-compose.yml up --build

stop:
	docker compose -f $(DIR)/docker-compose.yml down

down: stop

re: down up
