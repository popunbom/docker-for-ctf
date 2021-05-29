#!/bin/bash

CONTAINER_NAME="popunbom/docker-for-ctf"

if [[ ! $(docker images -q ${CONTAINER_NAME}) && -e "Dockerfile" ]]; then
  echo "Images not found. -- building"
  docker build -t ${CONTAINER_NAME} ./.devcontainer
fi;

if [[ $1 == "--rebuild" ]]; then
  echo "Rebuild images"
  docker build -t ${CONTAINER_NAME} ./.devcontainer
fi

docker run -it \
  -v "${PWD}":/ctf \
  --privileged \
  --cap-add=SYS_PTRACE \
  --security-opt="seccomp=unconfined" \
  ${CONTAINER_NAME} /bin/bash

