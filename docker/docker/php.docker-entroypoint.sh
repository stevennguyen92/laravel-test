#!/bin/sh
set -e

if [ "${ENABLE_CRONTAB:-0}" = "1" ]; then
  mv -f /etc/supervisor.d/cron.conf.default /etc/supervisor.d/cron.conf
  echo "* * * * * php /var/www/html/artisan schedule:run >> /dev/null 2>&1" >> /etc/crontabs
fi

# Enable Laravel queue workers
if [ "${ENABLE_WORKER:-0}" = "1" ]; then
  mv -f /etc/supervisor.d/worker.conf.default /etc/supervisor.d/worker.conf
else
  rm -f /etc/supervisor.d/worker.conf.default
fi

# Enable Laravel horizon
if [ "${ENABLE_HORIZON:-0}" = "1" ]; then
  mv -f /etc/supervisor.d/horizon.conf.default /etc/supervisor.d/horizon.conf
else
  rm -f /etc/supervisor.d/horizon.conf.default
fi

[ "$PHP_ENABLE_XDEBUG" = "true" ] && \
    docker-php-ext-enable xdebug && \
    echo "xdebug.remote_host=$PHP_XDEBUG_REMOTE" >> $PHP_INI_DIR/conf.d/zz-xdebug-settings.ini && \
    echo "Xdebug is enabled"

exec "$@"
