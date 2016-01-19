#!/bin/bash
set -e

if [ ! -f config.php ]; then
  echo "Initializing Database..."
  export PGPASSWORD=$POSTGRES_ENV_POSTGRES_PASSWORD
  psql -h postgres -U $POSTGRES_ENV_POSTGRES_USER -f schema/ttrss_schema_pgsql.sql $POSTGRES_ENV_POSTGRES_DB
  mv config.php-dist config.php
fi

exec "$@"