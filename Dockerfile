##
# dev stage
##
FROM php:7.3.9-fpm as dev

# Update packages
RUN apt-get update --quiet && \
    apt-get upgrade --quiet --yes

# Set application directory
RUN rm -r /var/www/html && \
    mkdir /var/www/app

WORKDIR /var/www/app

# Add some convenience
RUN echo "alias ll='ls -al'" > /etc/profile.d/app.sh

# Use php.ini for development
RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

# Install xdebug
RUN pecl install xdebug-2.7.2 && \
    docker-php-ext-enable xdebug

# Add app dependencies
RUN docker-php-ext-install -j$(nproc) pdo_mysql

# Install Composer
ENV COMPOSER_ALLOW_SUPERUSER=1
RUN apt-get install --quiet --yes wget \
                                  unzip \
                                  libzip4 \
                                  libzip-dev && \
    docker-php-ext-install -j$(nproc) zip && \
    wget https://raw.githubusercontent.com/composer/getcomposer.org/master/web/installer -O - -q | php -- --quiet --install-dir=/usr/local/bin --filename=composer

# Install symfony installer
RUN apt-get install --quiet --yes git && \
    wget https://get.symfony.com/cli/installer -O - | bash && \
    mv /root/.symfony/bin/symfony /usr/local/bin/symfony

##
# prod stage
##
FROM dev as prod

# Use php.ini for production
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

# Disable xdebug in production
RUN rm /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

# Install dependencies
ADD composer.json composer.lock symfony.lock ./
RUN composer install --no-interaction --no-dev --no-scripts --no-plugins

# Add sourcecode and run composer scripts
ADD . .
RUN composer install --no-interaction --no-dev
