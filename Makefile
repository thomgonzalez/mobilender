.PHONY: run_dev
run_dev:
	@docker-compose up

.PHONY: run_local
run_local:
	@docker-compose -f docker-compose.yml -f docker-compose-local.yml up

.PHONY: run
run:
	@docker-compose up -d

.PHONY: down
down:
	@docker-compose down

.PHONY: build
build:
	@docker-compose build

.PHONY: build_local
build_local:
	@docker-compose -f docker-compose.yml -f docker-compose-local.yml build

.PHONY: backend_sh
backend_sh:
	@docker exec -it mobilender_backend bash

.PHONY: backend_migrations
backend_migrations:
	@docker exec -it mobilender_backend python manage.py makemigrations

.PHONY: backend_migrate
backend_migrate:
	@docker exec -it mobilender_backend python manage.py migrate

.PHONY: backend_superuser
backend_superuser:
	@docker exec -it mobilender_backend python manage.py createsuperuser
