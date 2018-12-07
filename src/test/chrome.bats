#!/usr/bin/env bats

#CONTAINER_NAME & IMAGE_NAME defined by pipeline

@test "check that chrome can be called" {
  run docker run --rm -i --entrypoint /opt/google/chrome/google-chrome --name $CONTAINER_NAME $IMAGE_NAME --version
  echo $output | grep 'Google Chrome'
}
