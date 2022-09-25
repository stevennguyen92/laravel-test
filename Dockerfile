FROM php:8.1.10-fpm

WORKDIR /var/www/html

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git vim unzip cron \
    zip \
    libzip-dev \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libmcrypt-dev \
    openssl

# Install PHP extensions
RUN docker-php-ext-install pdo pdo_mysql mysqli pcntl

# Install supervisor
RUN apt-get install -y supervisor

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install xdebug
RUN pecl install -o xdebug-3.2.0alpha3

# Install Redis
RUN pecl install -o -f redis \
    &&  rm -rf /tmp/pear \
    &&  docker-php-ext-enable redis

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

COPY docker/supervisord.conf /etc/supervisord.conf
COPY docker/supervisor.d /etc/supervisor.d


RUN cp $PHP_INI_DIR/php.ini-development $PHP_INI_DIR/php.ini


# Add UID '1000' to www-data
RUN usermod -u 1000 www-data

# Copy existing application directory
COPY . .

RUN chown -R www-data:www-data ./storage ./bootstrap/cache

ENV ENABLE_CRONTAB 1
ENV ENABLE_HORIZON 1

ENTRYPOINT ["sh", "/var/www/html/docker/docker/php.docker-entroypoint.sh"]

CMD supervisord -n -c /etc/supervisord.conf
