# php-docker-app

This project intends to provide various php docker configurations as templates for new projects.

Feel free to comment, test, fix, contribute or add your own template.

## Branches
- master - providing php and nginx + composer
- php-nginx - basic php and nginx setup
- php-nginx-composer - basic php and nginx setup + composer

## docker-compose

The simplest way to start the webserver and php-fpm containers is to use `docker-compose` by running:

`project $ docker-compose up -d`

Run cron-jobs or any other command by starting a new container:

`project $ docker-compose run [--rm] app php --version`

## development and production stages

The docker image has two stages for development and production. This way development can take place inside
the same environment. For the development stage, debugging settings are enabled.

### docker-compose.yml & docker-compose.override.yml

The basic docker-compose.yml is intended to be extended by overrides and is therefore very minimal (no port
mappings e.g.). Extend it by adding your customized override file. Templates are provided for development
and production. The development override mounts the project directory from the host machine to enable rapid
development inside the container.
