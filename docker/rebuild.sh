#!/bin/bash
set -euo pipefail

cd "$(dirname "$0")/.."

IMAGE_NAME="corp"
IMAGE_TAG="latest"

echo "[rebuild] building production image..."
docker build . \
  --platform linux/amd64 \
  -f docker/Dockerfile \
  -t ${IMAGE_NAME}:${IMAGE_TAG}

docker build . -f ./docker/Dockerfile -t docker.arrow-payment.com/sanda-corp
docker push docker.arrow-payment.com/sanda-corp

