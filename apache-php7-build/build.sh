#!/bin/bash
cd "$(dirname "$0")"
docker build -t yoshz/apache-php-build:7.0-dev .
