#!/bin/bash

# Run composer only if vendor/ is missing
if [ ! -d "vendor" ]; then
  echo "Installing PHP dependencies..."
  composer install --no-dev --optimize-autoloader
  cp .env.example .env
  php artisan key:generate
  apt install vim -y
fi

exec "$@"

