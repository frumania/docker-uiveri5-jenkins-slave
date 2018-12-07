#!/usr/bin/env bats

#CONTAINER_NAME & IMAGE_NAME defined by pipeline

@test "check that timezone settings are correct" {
  run docker run --rm -i --entrypoint date --name $CONTAINER_NAME $IMAGE_NAME
  echo $output | grep "CE"
}
