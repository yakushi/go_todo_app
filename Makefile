.PHONY: help build build-local up down logs ps test generate
.DEFAULT_GOAL := help

DOCKER_TAG := latest
build: ## Build docker image to deploy
	docker build -t budougumi0617/gotodo:${DOCKER_TAG} \
		--target deploy ./

build-local: ## Build docker image to local development
	docker compose build --no-cache

up: ## Do docker compose up with hot reload
	docker compose up -d

down: ## Do docker compose down
	docker compose down

logs: ## Tail docker compose logs
	docker compose logs -f

ps: ## Check container status
	docker compose ps

test: up ## Execute tests
	go test -race -shuffle=on ./...

generate: ## Generate codes
	go generate ./...

auth/cert/secret.pem: ## Generate secret.pem
	openssl genrsa 4096 > $@

auth/cert/public.pem: auth/cert/secret.pem ## Generate public.pem
	openssl rsa -pubout < $< > $@

help: ## Show options
	@grep -E '^[A-Za-z_/.-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'