#!/usr/bin/env bats

#CONTAINER_NAME & IMAGE_NAME defined by pipeline

@test "check that operating system is of version 'stretch'" {
  run docker run --rm -i --entrypoint cat --name $CONTAINER_NAME $IMAGE_NAME /etc/os-release
  echo $output | grep '(stretch)'
}
