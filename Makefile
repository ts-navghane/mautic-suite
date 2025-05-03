# Makefile for automating submodule cloning and starting Docker containers

# Variables
DOCKER_COMPOSE_FILE=compose.yaml

# Default target
all: setup

# Clone submodule
clone-submodule:
	git submodule init && git submodule update --remote

# Start Docker containers
docker-up:
	docker-compose -f $(DOCKER_COMPOSE_FILE) up -d --build

# Combined setup
setup: clone-submodule docker-up

# Stop and remove Docker containers
docker-down:
	docker-compose -f $(DOCKER_COMPOSE_FILE) down

.PHONY: all clone-submodule docker-up setup docker-down
