#!/bin/bash
set -e
cd "$(dirname "$0")/.."

VERSIONS="5.5 7.0"
IMAGES="php apache-php apache-php-dev php-fpm php-fpm-dev php-fpm-v8js"

if [ -n "$1" ]; then
  if [[ $VERSIONS =~ $1 ]]; then
    VERSIONS=$1
  else
    echo "Error: Invalid version $1"
    exit 1
  fi
fi

if [ -n "$2" ]; then
  if [[ $IMAGES =~ $2 ]]; then
    IMAGES=$2
  else
    echo "Error: Invalid image $2"
    exit 1
  fi
fi

for VERSION in $VERSIONS
do
  for IMAGE in $IMAGES
  do
    IMAGE_DIR=${VERSION}/${IMAGE}
    rm -rf ${IMAGE_DIR}/dist
    cp -a shared-files ${IMAGE_DIR}/dist
    docker build -t yoshz/${IMAGE}:${VERSION} $IMAGE_DIR
  done
done
