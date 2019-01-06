#!/bin/bash
set -e

if [ "$TRAVIS_BRANCH" = "master" ]; then 
    docker login -u "$DOCKERHUB_USERNAME" -p "$DOCKERHUB_TOKEN"
    docker push "$DOCKERHUB_REGISTRY:latest"
else
    docker login -u "$DOCKERHUB_USERNAME" -p "$DOCKERHUB_TOKEN"
    docker push "$DOCKERHUB_REGISTRY:$TRAVIS_BRANCH"
fi