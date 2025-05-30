.PHONY: up down restart bash db-create db-drop db-config-show db-use db-name g-run g-up g-down g-version g-status g-create

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

g-run:
	@./scripts/database/goose/run.sh "$(run)" "$(name)"
g-up:
	@./scripts/database/goose/up.sh $(name)
g-down:
	@./scripts/database/goose/down.sh $(name)
g-version:
	@./scripts/database/goose/version.sh $(name)
g-status:
	@./scripts/database/goose/status.sh $(name)
g-create:
	@./scripts/database/goose/create.sh  $(word 2,$(MAKECMDGOALS)) $(word 3,$(MAKECMDGOALS))