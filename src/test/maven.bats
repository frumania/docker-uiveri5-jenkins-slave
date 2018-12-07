#!/usr/bin/env bats

#CONTAINER_NAME & IMAGE_NAME defined by pipeline

@test "check that maven works" {
  run docker run --rm -i --name $CONTAINER_NAME $IMAGE_NAME mvn -v
  echo $output | grep 'Maven home: /usr/share/maven'
}

@test "check docker entrypoint consistency (https://github.com/docker-library/official-images#consistency)" {
  run docker run --rm -i --name $CONTAINER_NAME $IMAGE_NAME echo test
  echo $output | grep "test"
  [ "$status" -eq 0 ]
}
