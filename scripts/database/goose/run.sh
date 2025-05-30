#!/usr/bin/env bash

source ./scripts/database/config/name.sh

ROOT=$(./scripts/root.sh)
database=$(get_db_name "$2")

if [ -z "$database" ]; then
  echo "could not find current database, use make db-use or pass a valid database"
  exit 1
fi

db_string=$(./scripts/database/config/string.sh $2)
database_path="$ROOT/database/$database"

cd $database_path

GOOSE_DBSTRING="$db_string" goose $1

docker compose exec app sh -c "GOOSE_DBSTRING=\"$db_string\" goose $1" 2>&1 | grep -v "no configuration file provided: not found"

exit 0