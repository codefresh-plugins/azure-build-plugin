#!/bin/sh
set -e

msg() { echo -e "INF---> $1"; }
err() { echo -e "ERR---> $1" ; exit 1; }

az login --service-principal -u $APP_ID -p $P --tenant $TENANT >/dev/null

az acr build --registry $ACR_NAME --image $IMAGE:$TAG --file ${DOCKERFILE_PATH:-Dockerfile} $CF_VOLUME_PATH/$CF_REPO_NAME/

cf_export AZURE_IMAGE=$ACR_NAME.azureecr.io/$IMAGE:$TAG
