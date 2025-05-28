#!/bin/bash

# Navigate to the parent directory where docker-compose.yml is located
ROOT=$(./scripts/root.sh)

cd "$ROOT/docker"

echo "$ROOT/docker"

# Check if any docker-compose services are running
if ! docker-compose ps | grep -q "Up"; then
  echo "Starting docker-compose services..."
  docker-compose up -d
else
  echo "Docker-compose services are already running."
fi
