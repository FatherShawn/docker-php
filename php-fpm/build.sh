#!/bin/bash
cd "$(dirname "$0")"
VERSION=$(cat VERSION)
rm -rf dist && mkdir dist && cp -a ../docker-files/* dist/
docker build -t yoshz/php-fpm:5.5-$VERSION .
docker build -t yoshz/php-fpm:5.5 .
