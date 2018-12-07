#!/usr/bin/env bats

#CONTAINER_NAME & IMAGE_NAME defined by pipeline

@test "Check that Node WebdriverIO test is successful with Chrome" {
  cd $BATS_TEST_DIRNAME/resources/node_webdriverio
  docker run --rm -w /usr/src/testautomation -v $BATS_TEST_DIRNAME/resources/node_webdriverio:/usr/src/testautomation:rw --entrypoint npm $IMAGE_NAME install
  run docker run --rm -w /usr/src/testautomation -v $BATS_TEST_DIRNAME/resources/node_webdriverio:/usr/src/testautomation:rw --entrypoint /opt/selenium/startSeleniumServer.sh $IMAGE_NAME  node index.js
  [ "$status" -eq 0 ]
}

@test "Check that Node WebdriverIO test is successful with Firefox" {
  cd $BATS_TEST_DIRNAME/resources/node_webdriverio_firefox
  docker run --rm -w /usr/src/testautomation -v $BATS_TEST_DIRNAME/resources/node_webdriverio_firefox:/usr/src/testautomation:rw --entrypoint npm $IMAGE_NAME install
  run docker run --rm -w /usr/src/testautomation -v $BATS_TEST_DIRNAME/resources/node_webdriverio_firefox:/usr/src/testautomation:rw --entrypoint /opt/selenium/startSeleniumServer.sh $IMAGE_NAME  node index.js
  [ "$status" -eq 0 ]
}





