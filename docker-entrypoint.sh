#!/bin/sh

###
# Production Entrypoint. Allows to execute startup tasks.
##

# Perform startup tasks
composer run-script auto-scripts

# Start PHP Fast Process Manager
php-fpm
