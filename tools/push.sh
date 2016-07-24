#!/bin/bash
set -e
cd "$(dirname "$0")/.."

CURRENT_RELEASE=2.5

IMAGES="php apache-php apache-php-dev php-fpm php-fpm-dev"

for VERSION in 5.5 5.6 7.0
do
  for IMAGE in $IMAGES
  do
    docker tag -f yoshz/${IMAGE}:${VERSION} yoshz/${IMAGE}:${VERSION}-${CURRENT_RELEASE}
    docker push yoshz/${IMAGE}:${VERSION}-${CURRENT_RELEASE}
    docker push yoshz/${IMAGE}:${VERSION}

    if [ "$VERSION" == "7.0" ]; then
      docker tag -f yoshz/${IMAGE}:${VERSION} yoshz/${IMAGE}:latest
      docker push yoshz/${IMAGE}:latest
    fi
  done
done
