#!/bin/bash

if [ -z "$1" ]; then
  echo "Erro: parâmetro 1 não foi informado."
  exit 1
fi

ROOT=$(./scripts/root.sh)
database="$1"
database_path="$ROOT/database/$database"
migrations_path="$ROOT/database/$database/migrations"
db_string="postgres://postgres:postgres@localhost:5432"
"$ROOT/scripts/docker/compose-up.sh"

mkdir -p "$migrations_path"
touch "$database_path/.env"

cat > "$database_path/.env" <<EOF
GOOSE_MIGRATION_DIR=./migrations
GOOSE_DBSTRING=$db_string/$database?sslmode=disable
GOOSE_DRIVER=postgres
EOF

cd $database_path

goose create create_database_$database sql
create_db_migration=$(find ./ -type f -name  *create_database*.sql)

echo $create_db_migration
cat > "$create_db_migration" <<EOF
-- +goose Up
-- +goose NO TRANSACTION
CREATE DATABASE $database;

-- +goose Down
-- +goose NO TRANSACTION
DROP DATABASE $database;
EOF

GOOSE_DBSTRING="$db_string/?sslmode=disable" goose up

cd $ROOT