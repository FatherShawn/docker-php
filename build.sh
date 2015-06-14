#!/bin/bash

VERSION=1.1
docker build -t yoshz/apache-php:5.5 apache-php
docker build -t yoshz/apache-php:5.5-$VERSION apache-php
docker push yoshz/apache-php:5.5
docker push yoshz/apache-php:5.5-$VERSION

VERSION=1.2
docker build -t yoshz/apache-php-dev:5.5 apache-php-dev
docker build -t yoshz/apache-php-dev:5.5-$VERSION apache-php-dev
docker push yoshz/apache-php-dev:5.5
docker push yoshz/apache-php-dev:5.5-$VERSION

VERSION=1.1
docker build -t yoshz/apache-php-drush:5.5 apache-php-drush
docker build -t yoshz/apache-php-drush:5.5-$VERSION apache-php-drush
docker push yoshz/apache-php-drush:5.5
docker push yoshz/apache-php-drush:5.5-$VERSION
