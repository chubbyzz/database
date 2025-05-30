source ./scripts/database/config/name.sh

database=$(get_db_name "$1")

if [ -z "$database" ]; then
  echo "could not find current database, use make db-use or pass a valid database"
  exit 1
fi

db_string="postgres://postgres:postgres@localhost:5432"

GOOSE_DBSTRING=$db_string/$database?sslmode=disable

echo $GOOSE_DBSTRING
