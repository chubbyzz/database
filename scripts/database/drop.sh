database="$1"
db_string="postgres://postgres:postgres@db:5432"
DBSTRING="$db_string?sslmode=disable"
ROOT=$(./scripts/root.sh)

docker compose -f docker/docker-compose.yml exec app sh -c "psql \"$DBSTRING\" -c \"DROP DATABASE IF EXISTS $database;\""

database_path="$ROOT/database/$database"

if [ ! -d "$database_path" ]; then
  echo "Directory does NOT exist: $database_path"

  exit 1
fi

rm -rf "$database_path"