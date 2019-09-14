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

##
# prod stage
##
FROM dev as prod

# Use php.ini for production
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

# Add app code
ADD . ./
