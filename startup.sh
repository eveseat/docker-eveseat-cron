#!/bin/sh
set -e

# Wait for the database
while ! mysqladmin ping -hmariadb --silent; do

    echo "MariaDB container might not be ready yet... sleeping..."
    sleep 3
done

/usr/sbin/crond -f -d 7
