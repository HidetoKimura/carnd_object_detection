#! /bin/bash
set -e

# Settings from environment
SHARE_VOLUME="`pwd`"
CONTAINER_IMAGE="nvidia_cuda_odlab"
CONTAINER_NAME="odlab"

if [ "$(docker ps -a | grep ${CONTAINER_NAME})" ]; then
  echo "Attaching to running container..."
  nvidia-docker exec -it ${CONTAINER_NAME} bash $@
else
  nvidia-docker run --name ${CONTAINER_NAME} --rm -it -p 8888:8888 -v "${SHARE_VOLUME}:/root/work" ${CONTAINER_IMAGE} $@
fi
