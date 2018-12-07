#!/usr/bin/env bats

#CONTAINER_NAME & IMAGE_NAME defined by pipeline

@test "check that firefox can be called" {
  run docker run --rm -i --entrypoint /usr/bin/firefox --name $CONTAINER_NAME $IMAGE_NAME --version
  echo $output | grep 'Firefox'
}
