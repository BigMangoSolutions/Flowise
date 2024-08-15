#!/bin/bash

ENV="${ENV:=stg}"
REGION="${REGION:=europe-west3}"

PROJECT_ID=""
if [ $ENV = "stg" ]; then
  PROJECT_ID="bms-api-stg-5396"
fi

timestamp=$(date +%s)
ts_tag="$ENV-${timestamp}"
VERSION="${VERSION:=$ts_tag}"

TAG="europe-docker.pkg.dev/${PROJECT_ID}/containers/bms-flowise:${VERSION}"

echo "Updating Flowise image ${TAG} in environment ${ENV}"
echo "Using Project ID: ${PROJECT_ID} and region ${REGION}"

echo "Verifying GCP credentials..."
v=$(gcloud run jobs list --project $PROJECT_ID --region $REGION)

echo "Building and pushing new Flowise image to Artifact Registry"
docker build -f Dockerfile.gcp . --tag $TAG
docker push $TAG

echo "Deploying new Flowise image to Cloud Run"
gcloud run deploy flowise --image $TAG --project $PROJECT_ID --region $REGION

echo "Remove local image"
docker rmi $TAG
