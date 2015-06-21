#!/bin/bash
cd "$(dirname "$0")"
VERSION=$(cat VERSION)
rm -rf dist && mkdir dist && cp -a ../docker-files/* dist/

docker run --name php7-build yoshz/apache-php-build:7.0-dev

docker cp php7-build:/usr/php7 dist/usr
docker cp php7-build:/etc/php7 dist/etc
docker cp php7-build:/usr/lib/apache2/modules/libphp7.so dist/usr/lib/apache2/modules
docker cp php7-build:/etc/apache2/mods-available/php7.load dist/etc/apache2/mods-available

docker stop php7-build > /dev/null
docker rm php7-build > /dev/null

docker build -t yoshz/apache-php:7.0-$VERSION .
docker build -t yoshz/apache-php:7.0 .
