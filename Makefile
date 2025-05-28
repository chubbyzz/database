.PHONY: db-create

db-create:
	./scripts/database/create.sh $(name)
db-config-show:
	./scripts/database/config/show.sh
