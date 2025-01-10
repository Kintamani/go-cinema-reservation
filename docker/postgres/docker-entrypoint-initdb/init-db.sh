#!/bin/bash
set -e

# Cek apakah environment variables sudah di-set
if [ -z "$BLUEPRINT_DB_USERNAME" ] || [ -z "$BLUEPRINT_DB_PASSWORD" ] || [ -z "$BLUEPRINT_DB_DATABASE" ]; then
  echo "Error: Environment variables BLUEPRINT_DB_USERNAME, BLUEPRINT_DB_PASSWORD, and BLUEPRINT_DB_DATABASE must be set."
  exit 1
fi

# Tunggu beberapa detik agar PostgreSQL siap
echo "Waiting for PostgreSQL to be ready..."
sleep 5

# Inisialisasi database dan user dengan environment variables dari Docker
psql -v ON_ERROR_STOP=1 --username "$BLUEPRINT_DB_USERNAME" <<-EOSQL
    CREATE USER $BLUEPRINT_DB_USERNAME WITH PASSWORD '$BLUEPRINT_DB_PASSWORD';
    CREATE DATABASE $BLUEPRINT_DB_DATABASE WITH OWNER $BLUEPRINT_DB_USERNAME ENCODING 'UTF8' LC_COLLATE='en_US.utf8' LC_CTYPE='en_US.utf8';
    ALTER DATABASE $BLUEPRINT_DB_DATABASE SET timezone TO 'Asia/Jakarta';
    GRANT ALL PRIVILEGES ON DATABASE $BLUEPRINT_DB_DATABASE TO $BLUEPRINT_DB_USERNAME;
EOSQL

echo "Database and user setup complete."
