.PHONY: up down restart bash db-create db-drop db-config-show db-use db-name

up:
	@./scripts/docker/compose/up.sh
down:
	@./scripts/docker/compose/down.sh
restart: down up
bash:
	docker-compose -f docker/docker-compose.yml run --rm app /bin/sh

db-create:
	@./scripts/database/create.sh $(name)
db-drop:
	@./scripts/database/drop.sh $(name)
db-up:
	@./scripts/database/up.sh $(name)
db-use:
	@./scripts/database/config/use.sh $(name)
db-name:
	@./scripts/database/config/name.sh
db-config-show:
	@./scripts/database/config/show.sh