#!/bin/bash
set -e
cd "$(dirname "$0")"
rm -rf dist && mkdir dist && cp -a ../../static-files/* dist/
docker build -t yoshz/php-fpm:5.5 .
