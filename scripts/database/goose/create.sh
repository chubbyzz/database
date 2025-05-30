ROOT=$(./scripts/root.sh)


$ROOT/scripts/database/goose/run.sh "create $1 sql" $2