#!/usr/bin/env bats

#CONTAINER_NAME & IMAGE_NAME defined by pipeline

@test "check that user with uid 1000 and gid 1000 exists" {
  run docker run --rm -i --entrypoint cat --name $CONTAINER_NAME $IMAGE_NAME /etc/passwd
  echo $output | grep 1000:1000
}

@test "check that user with uid 1000 and gid 1000 is logged in" {
  run docker run --rm -i --entrypoint id --name $CONTAINER_NAME $IMAGE_NAME
  echo $output | grep uid=1000
  echo $output | grep gid=1000
}

@test "check that user with uid 1000 is named piper" {
  run docker run --rm -i --entrypoint whoami --name $CONTAINER_NAME $IMAGE_NAME
  echo $output | grep piper
}

@test "check that user has it's home directory set to /home/piper" {
  run docker run --rm -i --entrypoint pwd --name $CONTAINER_NAME $IMAGE_NAME
  echo $output | grep /home/piper
}
