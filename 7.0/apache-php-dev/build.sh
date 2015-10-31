#!/bin/bash
set -e
cd "$(dirname "$0")"
rm -rf dist && mkdir dist && cp -a ../../static-files/* dist/
docker build -t yoshz/apache-php-dev:7.0 .
