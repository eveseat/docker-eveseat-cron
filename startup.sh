#!/bin/sh
set -e

# Wait for the database
while ! mysqladmin ping -h${DB_HOST} --silent; do

    echo "MariaDB container might not be ready yet... sleeping..."
    sleep 10
done

# Ensure we have vendor/ ready.
while [ ! -f /var/www/seat/vendor/autoload.php ]
do
    echo "SeAT code volume might not be ready yet... sleeping..."
    sleep 10
done

/usr/sbin/crond -f -d 7
