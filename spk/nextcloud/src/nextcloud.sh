#!/bin/sh

set -e

PHP="php -d open_basedir=none -f"
NEXTCLOUD="/var/services/web/nextcloud/cron.php"
SLEEP_TIME="1800"

# Main loop
while true; do
    # Update
    echo "Updating..."
    ${PHP} ${NEXTCLOUD}

    # Wait
    echo "Waiting ${SLEEP_TIME} seconds..."
    sleep ${SLEEP_TIME}
done
