#!/bin/bash

#taken from https://github.com/SeleniumHQ/docker-selenium/blob/master/NodeBase/functions.sh

# https://github.com/SeleniumHQ/docker-selenium/issues/184
function get_server_num() {
  echo $(echo $DISPLAY | sed -r -e 's/([^:]+)?:([0-9]+)(\.[0-9]+)?/\2/')
}