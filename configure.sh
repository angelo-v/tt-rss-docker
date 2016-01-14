#!/bin/bash

if [ !  -f /var/www/html/config.php ]; then

	echo 'configure...'
    cp /var/www/html/config.php-dist /var/www/html/config.php

	sed -i "s/define('DB_HOST', \".*\");/define('DB_HOST', \"postgres\");/g" config.php
	sed -i "s/define('DB_USER', \".*\");/define('DB_USER', \"${POSTGRES_ENV_POSTGRES_USER}\");/g" config.php
	sed -i "s/define('DB_NAME', \".*\");/define('DB_NAME', \"${POSTGRES_ENV_POSTGRES_DB}\");/g" config.php
	sed -i "s/define('DB_PASS', \".*\");/define('DB_PASS', \"${POSTGRES_ENV_POSTGRES_PASSWORD}\");/g" config.php
    sed -i "s/define('DB_PORT', \".*\");/define('DB_PORT', \"${POSTGRES_PORT_5432_TCP_PORT}\");/g" config.php

fi

echo "exec $@"

exec "apache2-foreground"
