#!/usr/bin/env bash

source ./scripts/database/config/name.sh

ROOT=$(./scripts/root.sh)
database=$(get_db_name "$1")

if [ -z "$database" ]; then
  echo "could not find current database, use make db-use or pass a valid database"
  exit 1
fi

db_string=$(./scripts/database/config/string.sh $1)
database_path="$ROOT/database/$database"

cd $database_path

echo $db_string