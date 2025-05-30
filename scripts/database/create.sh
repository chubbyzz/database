#!/bin/bash

if [ -z "$1" ]; then
  echo "Erro: parâmetro 1 não foi informado."
  exit 1
fi

ROOT=$(./scripts/root.sh)
database="$1"
database_path="$ROOT/database/$database"
migrations_path="$ROOT/database/$database/migrations"
db_string="postgres://postgres:postgres@db:5432"

mkdir -p "$migrations_path"
touch "$database_path/.env"

cat > "$database_path/.env" <<EOF
GOOSE_MIGRATION_DIR=./migrations
GOOSE_DBSTRING=$db_string/$database?sslmode=disable
GOOSE_DRIVER=postgres
EOF

cd $database_path

# goose create create_database_$database sql
# create_db_migration=$(find ./ -type f -name  *create_database*.sql)

# echo $create_db_migration
# cat > "$create_db_migration" <<EOF
# -- +goose Up
# -- +goose NO TRANSACTION
# CREATE DATABASE $database;

# -- +goose Down
# -- +goose NO TRANSACTION
# DROP DATABASE $database;
# EOF

# GOOSE_DBSTRING="$db_string/?sslmode=disable" goose up

# psql "$db_string/?sslmode=disable" -c "CREATE DATABASE $database;"

cd $ROOT

DBSTRING="$db_string?sslmode=disable"

docker compose -f docker/docker-compose.yml exec app sh -c "psql \"$DBSTRING\" -c \"CREATE DATABASE $database;\""

$ROOT/scripts/database/config/use.sh "$database"

echo "Database $database created successfully at $database_path"
