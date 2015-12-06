PHP Docker images
=================

This repository contains various Dockerfiles for PHP 5.5 and 7.0.
All images contain php-cli and composer and are based on [phusion/baseimage-docker](https://hub.docker.com/r/phusion/baseimage/) using `ubuntu:14.04`.

Dockerfiles
-----------

### PHP 5.5:
* [yoshz/php:5.5](5.5/php) Basic php-cli image with PHP 5.5
* [yoshz/php-v8js:5.5](5.5/php-v8js) PHP 5.5 with php-v8js extension.
* [yoshz/php-fpm:5.5](5.5/php-fpm) Image with PHP 5.5 and FPM enabled.
* [yoshz/php-fpm-dev:5.5](5.5/php-fpm-dev) Image with PHP 5.5, FPM enabled on port 9000 and various [development](#Development) tools.
* [yoshz/apache-php:5.5](5.5/apache-php) Image with Apache 2.4 and PHP 5.5.
* [yoshz/apache-php-dev:5.5](5.5/apache-php-dev) Development image with Apache 2.4, PHP 5.5 and various [development](#Development) tools.

### PHP 7.0
* [yoshz/php:7.0](7.0/php) Basic php-cli image with PHP 7.0
* [yoshz/apache-php:7.0](7.0/apache-php) Image with PHP 7.0 and Apache 2.4.
* [yoshz/apache-php-dev:7.0](7.0/apache-php-dev) Image with PHP 7.0, Apache 2.4 and various [development](#Development) tools.
* [yoshz/php-fpm:7.0](7.0/php-fpm) Image with PHP 7.0 and FPM enabled on port 9000.
* [yoshz/php-fpm-dev:7.0](7.0/php-fpm-dev) Image with PHP 7.0, FPM enabled on port 9000 and various [development](#Development) tools.

PHP Extensions
--------------

The following PHP extensions are enabled:

| Ext.     | 5.5     | 7.0
|----------|---------|---------
| apcu     | yes     | no
| curl     | yes     | yes
| gd       | yes     | yes
| mcrypt   | yes     | no
| mongo    | yes     | no
| mysql    | yes     | yes
| intl     | yes     | yes
| json     | yes     | yes
| sqlite   | yes     | yes

Apache modules
--------------

The following Apache modules are enabled:

| Module
|--------------
| headers
| rewrite
| ssl
| vhost_alias


Development
===========

All `<image>-dev` images are configured with:

* System tools:
  * `npm`: Node.js and NPM
  * `ruby`: Ruby 2
  * `bundle`: Bundler
* PHP tools:
  * `drush`: Drush 7
  * `phpunit`: PHPunit
  * `phpunit`: PHP Code Sniffer (including standards for Drupal and Symfony2)
* Build tools:
  * `bower`
  * `grunt`
  * `gulp`
  * `phing`

It is possible to create a new system user when the container starts by setting environment variables:
      
* *USER_CREATE*: Name of the user to create
* *USER_PUBLIC_KEY*: Public key to attach to the system user
* *USER_PASSWORD*: Password to attach to the system user
* *USER_ID*: User id of the new user
* *GIT_NAME*: GIT username to attach to system user
* *GIT_EMAIL*: GIT email to attach to system user

The user will be created with all sudo rights.

To start a new container run for example:

    docker run -p 80:80 -p 2022:22 \
        -v www:/var/www \
        -e USER_CREATE=$(id -un) \
        -e USER_PUBLIC_KEY=$(cat ~/.ssh/id_rsa.pub) \
        -e GIT_NAME=username \
        -e GIT_EMAIL=username@domain \
        yoshz/<image>-dev


Examples
========

The [examples](examples/) directory contains various `docker-composer` example files.

* Configure the environment variables:
```bash
    cp env_user.dist env_user
    vim env_user
```

* Use one of the compose files to start a new stack.

  * To start a stack with Apache, MySQL and PHP:
```bash
        docker-composer -f apache-stack.yml up
```
  * To start a stack with Nginx, MySQL and PHP-FPM.
```bash
        docker-composer -f nginx-stack.yml up
```

* When the stack is started you can login using SSH:
```bash
    ssh localhost -p 2022
```

* You can access mysql on localhost with password `pass`:
```bash
    mysql -h 127.0.0.1 -u root -p
```

* If all went right you will see a `Hello world` message in your webbrowser on `http://localhost/`. 



Contact
=======

For issues, questions or tips go to:
[https://github.com/yoshz/docker-php](https://github.com/yoshz/docker-php)
