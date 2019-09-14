FROM php:7.3.9-fpm

# Update packages
RUN apt-get update --quiet && \
    apt-get upgrade --quiet --yes
