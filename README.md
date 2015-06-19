PHP Docker images
=================

This repository contains Dockerfiles for the following PHP docker images.

All images are based on `ubuntu:14.04.2` image.


[yoshz/apache-php:5.5](apache-php)
----------------------------------

Production ready image with Apache 2.4 and PHP 5.5.


[yoshz/apache-php-drush:5.5](apache-php-drush)
----------------------------------------------

Production ready image with Apache 2.4, PHP 5.5 and Drush.

This image is based on `yoshz/apache-php:5.5`.


[yoshz/apache-php-dev:5.5](apache-php-dev)
------------------------------------------

Development image with Apache 2.4, PHP 5.5 and various build and testing tools.

This image is based on `yoshz/apache-php:5.5`.


[yoshz/apache-php:7.0](apache-php7)
------------------------------------

Image with PHP 7.0-dev and Apache 2.4.

This image image uses extracted files from `yoshz/php-build:7.0.0-dev` image.


[yoshz/apache-php-dev:7.0](apache-php7-dev)
------------------------------------

Image with PHP 7.0-dev, Apache 2.4 and various build and testing tools.

This image is based on `yoshz/apache-php:7.0`.


[yoshz/apache-php-build:7.0-dev](apache-php7-build)
----------------------

Image with Apache and PHP 7.0.0 build from source inluding all dev packages.

This image is not pushed to Docker Hub, but is used by `yoshz/apache-php:7.0` to extract the build files.


Build images
============

You can build all images by running `build.sh` in this directory or running `build.sh` in each directory.
