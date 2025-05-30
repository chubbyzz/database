ROOT=$(./scripts/root.sh)


get_db_name() {
  local input="$1"

  # Get ROOT from root.sh silently
  local ROOT
  ROOT=$(./scripts/root.sh "$input" 2>/dev/null)

  # Path to .env
  local ENV_FILE="$ROOT/.env"
  if [ ! -f "$ENV_FILE" ]; then
    echo ""  # Return empty if .env doesn't exist
    return
  fi

  # Export environment variables
  export $(grep -v '^#' "$ENV_FILE" | xargs)

  # Return input if provided
  if [ -n "$input" ]; then
    echo "$input"
  else
    # Return db_name if defined, else return empty
    if grep -q '^db_name=' "$ENV_FILE"; then
      echo "$db_name"
    else
      echo ""
    fi
  fi
}