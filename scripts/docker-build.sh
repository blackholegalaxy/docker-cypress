#!/bin/bash
set -e

if [ "$TRAVIS_BRANCH" = "master" ]; then 
    docker build --no-cache -t "$DOCKERHUB_REGISTRY:latest" .
else
    docker build --no-cache -t "$DOCKERHUB_REGISTRY:$TRAVIS_BRANCH" .
fi