APP_NAME = srcs/docker-compose.yaml

all: build files up
	docker-compose -f $(APP_NAME) up --build  -d

build:
	docker-compose -f $(APP_NAME) build

files:
	mkdir /home/esaci/data/wordpress || true
	mkdir /home/esaci/data/mariadb || true

clean:
	docker-compose -f $(APP_NAME) down -v
	rm -rf /home/esaci/data/wordpress || true
	rm -rf /home/esaci/data/mariadb || true

fclean: clean
	@ docker rm -f $(docker ps -a -q);docker volume rm $(docker volume ls -q);docker image rm $(docker image ls -q)

up:
	docker-compose -f $(APP_NAME) up

rm:
	docker-compose -f $(APP_NAME) down

re : rm build
	docker-compose -f $(APP_NAME) up -d



