#!/bin/bash
set -e
cd "$(dirname "$0")/.."

VERSIONS="5.5 5.6 7.0"

if [ -n "$1" ]; then
  if [[ $VERSIONS =~ $1 ]]; then
    VERSIONS=$1
  else
    echo "Error: Invalid version $1"
    exit 1
  fi
fi

if [ -n "$2" ]; then
  if [ -d "$VERSIONS/$2" ]; then
    IMAGES=$2
  else
    echo "Error: Invalid image $VERSIONS/$2"
    exit 1
  fi
else
  IMAGES="php apache-php apache-php-dev php-fpm php-fpm-dev"
fi

for VERSION in $VERSIONS
do
  for IMAGE in $IMAGES
  do
    IMAGE_DIR=${VERSION}/${IMAGE}

    echo
    echo
    echo
    echo -e "\e[0;33m---------------------------------------------------------------------"
    echo -e "       BUILDING yoshz/${IMAGE}:${VERSION}"
    echo -e "---------------------------------------------------------------------\e[0m"

    rm -rf ${IMAGE_DIR}/dist
    cp -a shared-files ${IMAGE_DIR}/dist
    docker build --rm -t yoshz/${IMAGE}:${VERSION} $IMAGE_DIR
    rm -rf ${IMAGE_DIR}/dist
  done
done
