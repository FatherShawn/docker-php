#!/bin/bash
set -e
./5.5/php/build.sh
./5.5/apache-php/build.sh
./5.5/apache-php-dev/build.sh
./5.5/php-fpm/build.sh
./5.5/php-fpm-dev/build.sh
./5.5/php-v8js/build.sh
./7.0/php/build.sh
./7.0/apache-php/build.sh
./7.0/apache-php-dev/build.sh
./7.0/php-fpm/build.sh
./7.0/php-fpm-dev/build.sh
