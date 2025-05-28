#!/bin/bash

# Navigate to the parent directory where docker-compose.yml is located
ROOT=$(./root.sh)

cd "$ROOT/docker"

echo "$ROOT/docker"

# Check if any docker-compose services are running
if ! docker-compose ps | grep -q "Up"; then
  echo "docker-compose nor runing services..."
else
  docker-compose down
fi
