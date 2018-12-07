#!/bin/bash

source /opt/selenium/functions.sh

echo
echo "--- Delete display lock"
echo
rm -f /tmp/.X*lock

echo
echo "--- Restart dbus"
echo
sudo /etc/init.d/dbus restart

export GEOMETRY="$SCREEN_WIDTH""x""$SCREEN_HEIGHT""x""$SCREEN_DEPTH"
export SERVERNUM=$(get_server_num)

echo
echo "--- Starting Xvfb"
echo
echo "using display: "$SERVERNUM
/usr/bin/Xvfb :$SERVERNUM -screen 0 $GEOMETRY -ac -extension RANDR +render -noreset &

#echo
#echo "--- Settings PROXY"
#echo
#export PROXY="http://proxy.wdf.sap.corp:8080/"
#export HTTP_PROXY="http://proxy.wdf.sap.corp:8080/"
#export HTTPS_PROXY="http://proxy.wdf.sap.corp:8080/"


echo
echo "--- Execute command"
echo
exec "$@"
