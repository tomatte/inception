.PHONY: 

DIR		=	./srcs

up:
	docker compose -f $(DIR)/docker-compose.yml up

all: up

build:
	docker compose -f $(DIR)/docker-compose.yml up --build

down:
	docker compose -f $(DIR)/docker-compose.yml down

re: down up
