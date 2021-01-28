# Generates a help message. Borrowed from https://github.com/pydanny/cookiecutter-djangopackage.
help: ## Display this help message.
	@echo "Please use \`make <target>' where <target> is one of"
	@awk -F ':.*?## ' '/^[a-zA-Z]/ && NF==2 {printf "\033[36m  %-28s\033[0m %s\n", $$1, $$2}' Makefile | sort

dev.init: dev.env.check

dev.env.%:
	./env.sh $*

dev.shell.%: ## Run a shell on the specified service's container.
	docker-compose exec $* /bin/bash
dev.up: env.check-memory ## Bring up services and their dependencies.
	docker-compose up -d
dev.up.%: env.check-memory ## Bring up services and their dependencies.
	docker-compose up -d $*
dev.stop: ## Stop all running services.
	docker-compose stop
dev.stop.%: ## Stop all running services.
	docker-compose stop $*
dev.down: ## Stop and remove containers and networks for all services.
	docker-compose down
dev.logs: ## View logs from running containers.
	docker-compose logs -f
dev.logs.%: ## View the logs of the specified service container.
	docker-compose logs -f --tail=500 $*
dev.ps: ## View list of created services and their statuses.
	docker-compose ps
env.check-memory: ## Check if enough memory has been allocated to Docker.
	@if [ `docker info --format '{{.MemTotal}}'` -lt 2095771648 ]; then echo "\033[0;31mWarning, System Memory is set too low!!! Increase Docker memory to be at least 2 Gigs\033[0m"; fi || exit 0

dev.clone: dev.clone.https ## Clone service repos to the parent directory.

dev.clone.https: ## Clone service repos using HTTPS method to the parent directory.
	./repo.sh clone
