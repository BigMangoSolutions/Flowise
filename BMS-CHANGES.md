# BMS changes done to Flowise

Here we keep track of the changes we do to this fork of Flowise.

## Build and deploy

To build a local docker image:

```sh
./scripts/build-local.sh
```

To Deploy flowise to GCP

```sh
export ENV="stg" # stg, prd
./scripts/deploy-flowise.sh
```

## Changes

- Made a copy of Dockerfile as Dockerfile.gcp and added Cloud SQL volume
- Added build script scripts/build-local.sh
- Added build and deploy script scripts/deploy-flowise.sh
- Made a copy of Dockerfile as Dockerfile.dev and modified it for faster builds
- Added missing dependency to UI package: @mui/system
- Added missing dependencies to Components package: uuid, @aws-sdk/client-bedrock-agent-runtime
- Added missing devDependencies to Components package: @types/uuid
- Added missing devDependencies to Server package: @types/express-serve-static-core, @types/express

- Added new dependency to Components package: moment-timezone
