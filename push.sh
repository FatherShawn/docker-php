#!/bin/bash
set -e

IMAGES_55="php apache-php apache-php-dev php-fpm php-fpm-dev php-v8js"
IMAGES_70="php apache-php apache-php-dev php-fpm php-fpm-dev"
VERSION=2.1

for IMAGE in $IMAGES_55
do
    docker tag -f yoshz/${IMAGE}:5.5 yoshz/${IMAGE}:latest
    docker tag -f yoshz/${IMAGE}:5.5 yoshz/${IMAGE}:5.5-${VERSION}
    docker push yoshz/${IMAGE}:5.5-$VERSION
    docker push yoshz/${IMAGE}:5.5
    docker push yoshz/${IMAGE}:latest
done

for IMAGE in $IMAGES_70
do
    docker tag -f yoshz/${IMAGE}:7.0 yoshz/${IMAGE}:7.0-${VERSION}
    docker push yoshz/${IMAGE}:7.0-$VERSION
    docker push yoshz/${IMAGE}:7.0
done
