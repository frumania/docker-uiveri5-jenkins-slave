#!/usr/bin/env bats

#CONTAINER_NAME & IMAGE_NAME defined by pipeline

@test "check that npm works" {
  run docker run --rm -i --entrypoint npm --name $CONTAINER_NAME $IMAGE_NAME -v
  echo $output | grep '6.'
}

@test "check that node works" {
  run docker run --rm -i --entrypoint node --name $CONTAINER_NAME $IMAGE_NAME -v
  echo $output | grep 'v8.'
}

@test "check that npm knows the SAP registry" {
  run docker run --rm -i --entrypoint npm --name $CONTAINER_NAME $IMAGE_NAME config get registry
  echo $output | grep 'http://nexus.wdf.sap.corp:8081/nexus/content/groups/build.milestones.npm'
}

@test "check that npm is able to install packeges globally" {
  run docker run --rm -i --entrypoint npm --name $CONTAINER_NAME $IMAGE_NAME install -g whitesource
  echo $output | grep 'whitesource@'
}

@test "check that npm is able to install @sap scoped packages globally" {
  run docker run --rm -i --entrypoint npm --name $CONTAINER_NAME $IMAGE_NAME install -g @sap/approuter
  echo $output | grep '@sap/approuter@'
}
