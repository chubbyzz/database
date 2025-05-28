ROOT=$(./scripts/root.sh)

export $(grep -v '^#' $ROOT/scripts/database/config/.env | xargs)

echo "#-------------- DATABASE CONFIG ----------------------#"
echo "\nusername: $username\npass: $pass\nhost: $host\nport: $port\n\n"
echo "connection string: $db_string\n"
echo "#-------------- DATABASE CONFIG ----------------------#"

