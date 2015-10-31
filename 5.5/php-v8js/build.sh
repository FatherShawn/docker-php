#!/bin/bash
set -e
cd "$(dirname "$0")"
docker build -t yoshz/php-v8js:5.5 .
