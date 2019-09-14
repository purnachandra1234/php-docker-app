# php-docker-app

This project intends to provide various php docker configurations as templates for new projects.

Feel free to comment, test, fix, contribute or add your own template.

## Branches
- master - providing php, nginx and mysql + symfony skeleton & Doctrine
- php-nginx - basic php and nginx setup
- php-nginx-mysql - basic php, nginx and mysql setup
- php-nginx-composer - basic php and nginx setup + composer
- php-nginx-mysql-composer - basic php, nginx and mysql setup + composer
- php-nginx-symfony - basic php and nginx setup + symfony skeleton
- php-nginx-mysql-symfony - basic php, nginx and mysql + symfony skeleton & Doctrine

## docker-compose

The simplest way to start the webserver and php-fpm containers is to use `docker-compose` by running:

```console
jdoe@host:/home/jdoe/projects/app $ docker-compose up -d
```

Run cron-jobs or any other command by starting a new container:
```console
jdoe@host:/home/jdoe/projects/app $ docker-compose run [--rm] app php --version
PHP 7.3.9 (cli) (built: Sep 12 2019 10:23:43) ( NTS )
Copyright (c) 1997-2018 The PHP Group
Zend Engine v3.3.9, Copyright (c) 1998-2018 Zend Technologies
    with Xdebug v2.7.2, Copyright (c) 2002-2019, by Derick Rethans 
```

Hook into running container to run your php software inside its environment:
```console
jdoe@host:/home/jdoe/projects/app $ docker-compose exec app bash -l
root@app:/var/www/app# php --version
PHP 7.3.9 (cli) (built: Sep 12 2019 10:23:43) ( NTS )
Copyright (c) 1997-2018 The PHP Group
Zend Engine v3.3.9, Copyright (c) 1998-2018 Zend Technologies
    with Xdebug v2.7.2, Copyright (c) 2002-2019, by Derick Rethans 
```

The same for a fresh container instance:
```console
jdoe@host:/home/jdoe/projects/app $ docker-compose run --rm app bash -l
root@app:/var/www/app# php --version
PHP 7.3.9 (cli) (built: Sep 12 2019 10:23:43) ( NTS )
Copyright (c) 1997-2018 The PHP Group
Zend Engine v3.3.9, Copyright (c) 1998-2018 Zend Technologies
    with Xdebug v2.7.2, Copyright (c) 2002-2019, by Derick Rethans 
```

## development and production stages

The docker image has two stages for development and production. This way development can take place inside
the same environment. For the development stage, debugging settings are enabled.

### docker-compose.yml & docker-compose.override.yml

The basic docker-compose.yml is intended to be extended by overrides and is therefore very minimal (no port
mappings e.g.). Extend it by adding your customized override file. Templates are provided for development
and production. The development override mounts the project directory from the host machine to enable rapid
development inside the container.

## composer (php)
The latest master version of composer (https://getcomposer.org) is installed. Use it from a running container
 to manage your app: 

```console
jdoe@host:/home/jdoe/projects/app $ docker-compose exec app bash -l
root@app:/var/www/app# composer --version
Composer version 1.9.0 2019-08-02 20:55:32
```

... or run it inside a fresh container, if you prefer:
```console
jdoe@host:/home/jdoe/projects/app $ docker-compose run --rm app bash -l
root@app:/var/www/app# composer --version
Composer version 1.9.0 2019-08-02 20:55:32
```

## symfony 4.3
The symfony 4.3 skelleton, as well as the symfony installer is part of the proect. Use the skeleton or remove
it and use the `smyonfy` command to create a new project.
```console
app $ docker-compose run --rm app bash -l
root@app:/var/www/app# symfony new myapp
...
```
