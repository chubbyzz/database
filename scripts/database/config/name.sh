ROOT=$(./scripts/root.sh)

export $(grep -v '^#' $ROOT/.env | xargs)

input="$1"

if [ -n "$input" ]; then
   echo "database: $input"
else
  echo "database: $db_name"
fi
