#!/bin/bash

TAG="bms-flowise:latest"

echo "Building new Flowise image to be used locally"
docker build -f Dockerfile.dev . --tag $TAG
