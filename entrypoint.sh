#!/bin/sh
set -e

msg() { echo -e "INF---> $1"; }
err() { echo -e "ERR---> $1" ; exit 1; }

ACR_NAME=codefreshregistry
RES_GROUP=$ACR_NAME

az login -u $USER -p $PWD >/dev/null

az acr build --registry $ACR_NAME --image $IMAGE:$TAG --file ${DOCKERFILE_PATH:-Dockerfile} $CF_VOLUME_PATH/$CF_REPO_NAME/
