

# DOCKER TASKS
APP_NAME = srcs/docker-compose.yaml

all: build up

build: 
	docker-compose -f $(APP_NAME) build
	

up:
	docker-compose -f $(APP_NAME) up -d
	awk '{w=$1} END{print w}' hosts | 

rm:
	docker-compose -f $(APP_NAME) down

logs nginx :
	docker-compose -f $(APP_NAME) logs nginx
reset :
	rm -rf /home/esaci/data/*
re : rm build up



