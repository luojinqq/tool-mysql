#!/usr/bin/env sh

export COMMAND=$(echo $1 | tr '[:lower:]' '[:upper:]');

if [ ${COMMAND} == 'DOCKER-UP' ]; then
  echo 'Starting...'
  docker-compose -f docker-compose.yml -f docker-compose.build.yml up --build
elif [ ${COMMAND} == 'DOCKER-PACKAGE' ]; then
  echo 'Building docker image...'
  docker-compose -f docker-compose.yml -f docker-compose.build.yml build --pull
elif [ ${COMMAND} == 'DOCKER-PUSH' ]; then
  echo 'Pushing docker registry...'
  docker-compose -f docker-compose.yml -f docker-compose.build.yml push
fi;
