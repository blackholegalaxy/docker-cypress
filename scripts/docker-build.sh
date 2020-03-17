#!/bin/bash
set -e

docker pull $DOCKERHUB_REGISTRY:latest || true

if [ "$TRAVIS_BRANCH" = "master" ]; then
    docker build --cache-from $DOCKERHUB_REGISTRY:latest -t "$DOCKERHUB_REGISTRY:latest" .
else
    docker build --cache-from $DOCKERHUB_REGISTRY:latest -t "$DOCKERHUB_REGISTRY:$TRAVIS_BRANCH" .
fi
