.PHONY: db-create db-config-show up down

up:
	./scripts/docker/compose/up.sh
down:
	./scripts/docker/compose/down.sh
restart: down up
db-create:
	./scripts/database/create.sh $(name)
db-config-show:
	./scripts/database/config/show.sh
