#!/usr/bin/env bats

#CONTAINER_NAME & IMAGE_NAME defined by pipeline

@test "check that proxy is configured correctly" {
  run docker run --rm -i --entrypoint curl --name $CONTAINER_NAME $IMAGE_NAME --silent --show-error --write-out '%{response_code}' --location http://www.sap.com -output /dev/null
  echo $output | grep "200"
}
