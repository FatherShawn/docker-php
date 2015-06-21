#!/bin/bash
cd "$(dirname "$0")"
VERSION=$(cat VERSION)
rm -rf dist && mkdir dist && cp -a ../docker-files/* dist/
docker build -t yoshz/apache-php-dev:7.0-$VERSION .
docker build -t yoshz/apache-php-dev:7.0 .
