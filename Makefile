.PHONY: help init

##
## available commandas:
##---------------------------------------------------------------------------

help: ## show this help
	@grep -E '(^[a-zA-Z0-9_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

init: ## install dependencies and setup
	docker compose up -d
	docker compose exec phpstan-bug sh -c 'apk add composer'
	docker compose exec phpstan-bug composer install

phpstan-bug: ## reproduce the phpstan bug
	docker compose exec phpstan-bug ./vendor/bin/phpstan analyse -- vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php

shell: ## enter a shell
	docker compose exec phpstan-bug sh