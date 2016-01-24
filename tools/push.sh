#!/bin/bash
set -e
cd "$(dirname "$0")/.."

CURRENT_RELEASE=2.3

for VERSION in 5.5 5.6 7.0
do
  for IMAGE in `ls $VERSION`
  do
    docker tag -f yoshz/${IMAGE}:${VERSION} yoshz/${IMAGE}:${VERSION}-${CURRENT_RELEASE}
    docker push yoshz/${IMAGE}:${VERSION}-${CURRENT_RELEASE}
    docker push yoshz/${IMAGE}:${VERSION}

    if [ "$VERSION" -eq "7.0" ]; then
      docker tag -f yoshz/${IMAGE}:${VERSION} yoshz/${IMAGE}:latest
      docker push yoshz/${IMAGE}:latest
    fi
  done
done
