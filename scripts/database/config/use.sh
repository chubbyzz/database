ROOT=$(./scripts/root.sh)

#!/bin/bash

# Check if a parameter is passed
if [ -z "$1" ]; then
  echo "pass a valid database name"
  exit 1
fi

# Define the database root path
DB_ROOT="$ROOT/database"

echo $DB_ROOT

# Check if the parameter is a valid folder inside the database root path
TARGET_FOLDER="$DB_ROOT/$1"
if [ ! -d "$TARGET_FOLDER" ]; then
  echo "Not fould a valid database names $1, you could create a new database using make db-create or use an existing one."
  exit 1
fi

# Define the .env file path
ENV_FILE="$ROOT/.env"

# Check if the .env file exists
if [ ! -f "$ENV_FILE" ]; then
  echo ".env file not found at $ENV_FILE"
  exit 1
fi

# Update the db_name variable in the .env file
sed -i "s/^db_name=.*/db_name=$1/" "$ENV_FILE"

echo "Using database: $1"