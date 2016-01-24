PHP Docker images
=================

This repository contains various [Dockerfiles](https://www.docker.com/) with [PHP](http://www.php.net/) 5.5, 5.6 or 7.0.

Dockerfiles
-----------

All images contain `php-cli` and `composer` and use the base image [phusion/baseimage-docker](https://hub.docker.com/r/phusion/baseimage/) based on `ubuntu:14.04`.
All images ending with `-dev` are development images which contains with specific settings and tools (see chapter below).

| Image                  | Tags
|------------------------|------------
| yoshz/php              | [5.5](5.5/php), [5.6](5.6/php), [7.0](7.0/php)
| yoshz/apache-php       | [5.5](5.5/apache-php), [5.6](5.6/apache-php), [7.0](7.0/apache-php)
| yoshz/apache-php-dev   | [5.5](5.5/apache-php-dev), [5.6](5.6/apache-php-dev), [7.0](7.0/apache-php-dev)
| yoshz/php-fpm          | [5.5](5.5/php-fpm), [5.6](5.6/php-fpm), [7.0](7.0/php-fpm)
| yoshz/php-fpm-dev      | [5.5](5.5/php-fpm-dev), [5.6](5.6/php-fpm-dev), [7.0](7.0/php-fpm-dev)
| yoshz/php-fpm-v8js     | [5.5](5.5/php-fpm-v8js), [5.6](5.6/php-fpm-v8js), [7.0](7.0/php-fpm-v8js)
| yoshz/php-fpm-v8js-dev | [5.5](5.5/php-fpm-v8js-dev), [5.6](5.6/php-fpm-v8js-dev), [7.0](7.0/php-fpm-v8js-dev)


Development images
==================

All `-dev` images can be used for local development. Never use these images on production as they are insecure!
The following software is installed:

* Openssh server
* [Xdebug extension](http://xdebug.org/)
* System tools:
  * [nodejs](https://nodejs.org/)
  * [npm](https://www.npmjs.com/)
  * [ruby](https://rubygems.org/)
  * [bundler](http://bundler.io/)
* PHP tools:
  * [Drush 7](https://github.com/drush-ops/drush)
  * [PHPunit 4](https://github.com/sebastianbergmann/phpunit)
  * [PHP Code Sniffer](https://github.com/squizlabs/PHP_CodeSniffer) (including extra standards for [Drupal](https://www.drupal.org/project/coder) and [Symfony2](https:///github.com/escapestudios/Symfony2-coding-standard))
* Build tools:
  * [bower](http://bower.io/)
  * [grunt](http://gruntjs.com/)
  * [gulp](http://gulpjs.com/)
  * [phing](https://www.phing.info/)

It is possible to configure a specific user to start the container by setting environment variables:

* *USER_CREATE*: Name of the user to create
* *USER_PUBLIC_KEY*: Public key to attach to the system user
* *USER_PASSWORD*: Password to attach to the system user
* *USER_ID*: User id of the new user
* *GIT_NAME*: GIT username to attach to system user
* *GIT_EMAIL*: GIT email to attach to system user
* *RUN_USER*: User which starts FPM or Apache
* *RUN_GROUP*: Group which starts FPM or Apache

The user will be created with all sudo rights.

To start a new container run for example:

    docker run -p 80:80 -p 2022:22 \
        -v www:/var/www \
        -e USER_CREATE=$(id -un) \
        -e USER_PUBLIC_KEY=$(cat ~/.ssh/id_rsa.pub) \
        -e GIT_NAME=username \
        -e GIT_EMAIL=username@domain \
        yoshz/<image>-dev


Getting started
===============

The best way to get started is to use one of the `docker-compose` files in the [examples](examples) directory.

When you use one of the `*-dev` images you have to configure an environment file.
This environment files tells the container which user should be created and how this user can login.

* Configure the environment variables:
```bash
    cd examples
    cp env_user.dist env_user
    vim env_user
```

* Choose one of the compose files to start a new stack.

  * To start a stack with Apache, MySQL and PHP:
```bash
        docker-compose -f apache-stack.yml up
```
  * To start a stack with Nginx, MySQL and PHP-FPM.
```bash
        docker-compose -f nginx-stack.yml up
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


PHP extensions
==============

The following PHP extensions are enabled:

| Extension
|------------
| curl
| gd
| mcrypt
| mysql
| intl
| json
| sqlite


Apache modules
==============

The following Apache modules are enabled:

| Module
|--------------
| headers
| rewrite
| ssl
| vhost_alias


Changelog
=========

Version 2.2 (2016-01-24)
------------------------

* Added PHP 5.6 images
* Added php-fpm-v8js and php-fpm-v8js-dev images
* Removed test.sh files from images
* Replaced image specific build.sh with a generic one
* All *-dev images have mysql-client and xdebug installed now
* Replaced from ppa:ondrej/php-7.0 with ppa:ondrej/php repository
* Update nodejs to 5.5.0 and npm to 3.5.3
* Added new git aliases to all *-dev images

Version 2.1 (2016-01-03)
------------------------

* Added static ssh host keys for dev images.
* Added `RUN_USER` and `RUN_GROUP` environment variables to configure user and group for services to run from.
* Upgraded drush to 7.0.
* Added [git aware prompt](https://github.com/jimeh/git-aware-prompt).


Version 2.0 (2016-12-06)
------------------------

* Replaced base image `ubuntu:14.04` with `phusion/baseimage`.


Contact
=======

For issues, questions or tips go to:
[https://github.com/yoshz/docker-php](https://github.com/yoshz/docker-php)
