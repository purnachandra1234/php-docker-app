FROM php:7.3.9-fpm

# Update packages
RUN apt-get update --quiet && \
    apt-get upgrade --quiet --yes

# Set application directory
RUN rm -r /var/www/html && \
    mkdir /var/www/app

WORKDIR /var/www/app

# Add some convenience
RUN echo "alias ll='ls -al'" > /etc/profile.d/app.sh
