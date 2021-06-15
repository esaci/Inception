

# DOCKER TASKS
APP_NAME = srcs/docker-compose.yaml

all: ## Clean the generated/compiles files
	docker-compose -f $(APP_NAME) up --build  -d
# Build the container
build: ## Build the release and develoment container. The development
	docker-compose -f $(APP_NAME) build
	

up: ## Spin up the project
	docker-compose -f $(APP_NAME) up --build

rm:  ## Stop and remove running containers
	docker-compose -f $(APP_NAME) down
logs nginx :
	docker-compose -f $(APP_NAME) logs nginx
reset :
	rm -rf /home/esaci/data/*
re : rm up



