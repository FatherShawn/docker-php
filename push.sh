#!/bin/bash

VERSION=$(cat apache-php/VERSION)
docker push yoshz/apache-php:5.5-$VERSION
docker push yoshz/apache-php:5.5

VERSION=$(cat apache-php-dev/VERSION)
docker push yoshz/apache-php-dev:5.5-$VERSION
docker push yoshz/apache-php-dev:5.5

VERSION=$(cat apache-php-drush/VERSION)
docker push yoshz/apache-php-drush:5.5-$VERSION
docker push yoshz/apache-php-drush:5.5

VERSION=$(cat apache-php7/VERSION)
docker push yoshz/apache-php:7.0-$VERSION
docker push yoshz/apache-php:7.0

VERSION=$(cat apache-php7-dev/VERSION)
docker push yoshz/apache-php-dev:7.0-$VERSION
docker push yoshz/apache-php-dev:7.0
