#!/bin/sh

set -e

PHP="/usr/local/bin/php56 -d open_basedir=none -d extension=zip.so -d extension=gd.so -d extension=curl.so -d extension=posix.so -f"
OWNCLOUD="/var/services/web/owncloud/cron.php"
SLEEP_TIME="1800"

# Main loop
while true; do
    # Update
    echo "Updating..."
    ${PHP} ${OWNCLOUD}

    # Wait
    echo "Waiting ${SLEEP_TIME} seconds..."
    sleep ${SLEEP_TIME}
done
