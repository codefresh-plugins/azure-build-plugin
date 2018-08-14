#!/bin/sh
set -e

msg() { echo -e "INF---> $1"; }
err() { echo -e "ERR---> $1" ; exit 1; }

ACR_NAME=codefreshregistry
RES_GROUP=$ACR_NAME
APP_ID=d09729bc-cbd4-45fa-a960-d73c4e6a9097
TENANT=ee3f07b0-0b4f-4929-acb0-643894a174fa
P=c9c6b165-3fbe-456f-8e3c-d8830c4fdcbf

az login --service-principal -u $APP_ID -p $P --tenant $TENANT >/dev/null

az acr build --registry $ACR_NAME --image $IMAGE:$TAG --file ${DOCKERFILE_PATH:-Dockerfile} $CF_VOLUME_PATH/$CF_REPO_NAME/
