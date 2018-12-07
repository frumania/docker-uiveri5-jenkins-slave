#!/usr/bin/env bats

#CONTAINER_NAME & IMAGE_NAME defined by pipeline

@test "Check that visualtest can be launched without selenium server" {
  run docker run --rm --entrypoint /opt/selenium/startVisualTest.sh $IMAGE_NAME --help
  echo $output | grep "Skipped startup of selenium server"
}

@test "Check that visualtest can be launched with selenium server" {
  run docker run -e "USE_SELENIUM_JAR=TRUE" --rm --entrypoint /opt/selenium/startVisualTest.sh $IMAGE_NAME --help
  echo $output | grep 'Starting selenium server'
}

@test "Check that visualtest can be installed with a defined version" {
  run docker run -e "VISUALTEST_VERSION=v1.27.5" --rm --entrypoint /opt/selenium/startVisualTest.sh $IMAGE_NAME
  echo $output | grep 'visualtestjs v1.27.5'
}

@test "Check that visualtest extension can be installed" {
  run docker run -e "VISUALTEST_EXTENSION_DIR=tests/ui" --rm --entrypoint /opt/selenium/startVisualTest.sh $IMAGE_NAME
  echo $output | grep 'Install visualtest extensions'
}



