composer:
	cd composer && docker buildx build --platform linux/amd64,linux/arm64 -t gunterthomas/composer:2.0.8 --push . && cd ..
.PHONY: composer

php:
	cd php && docker buildx build --build-arg UID=1000 --build-arg GID=1000 --platform linux/amd64,linux/arm64 -t gunterthomas/php:7.4 --push --file Dockerfile_74 .
.PHONY: php

php81:
	cd php && docker buildx build --build-arg UID=1000 --build-arg GID=1000 --platform linux/amd64,linux/arm64 -t gunterthomas/php:8.1 --push --file Dockerfile_81 .
.PHONY: php81

gearman:
	cd gearman-job-server && docker buildx build --platform linux/amd64,linux/arm64 -t gunterthomas/gearman-job-server:latest --push .
.PHONY: gearman

help: ## Show this help prompt
	@echo '  Usage:'
	@echo ''
	@echo '    make <target>'
	@echo ''
	@echo '  Targets:'
	@echo ''
	@sed -n 's/^##//p' $< $(MAKEFILE_LIST)
	@grep -E '^[a-zA-Z_-]+:.*?## ?.*$$' $(MAKEFILE_LIST) | sed 's/ ##//g' | sed '/.*/ s/^/    /' | column -t -s ':' | sort
	@echo ''
.PHONY: help

%:
	@$(MAKE) --no-print-directory help

.DEFAULT_GOAL := help