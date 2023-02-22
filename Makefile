composer:
	cd composer && docker buildx build --platform linux/amd64,linux/arm64 -t gunterthomas/composer:2.0.8 --push . && cd ..
.PHONY: composer

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