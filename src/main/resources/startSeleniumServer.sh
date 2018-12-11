#!/bin/bash -e

source /opt/selenium/functions.sh

echo
echo "--- Delete display lock"
echo
rm -f /tmp/.X*lock

# echo
# echo "--- Restart dbus"
# echo
# EDIT MARCEL
# sudo /etc/init.d/dbus restart

export GEOMETRY="$SCREEN_WIDTH""x""$SCREEN_HEIGHT""x""$SCREEN_DEPTH"
export SERVERNUM=$(get_server_num)

echo
echo "--- Starting Xvfb"
echo
echo "using display: "$SERVERNUM
/usr/bin/Xvfb :$SERVERNUM -screen 0 $GEOMETRY -ac -extension RANDR +render -noreset &

echo
echo "--- Starting Starting Selenium Server"
echo
#java -Dwebdriver.chrome.driver=/opt/selenium/chromedriver -jar /opt/selenium/selenium-server-standalone.jar -browserSideLog -debug -timeout 60 &
# EDIT MARCEL remove debug
java -Dwebdriver.chrome.driver=/opt/selenium/chromedriver -jar /opt/selenium/selenium-server-standalone.jar -browserSideLog -timeout 60 &


echo
echo "--- Sleep 10s"
echo
exec sleep 10s

echo
echo "--- Execute command"
echo
exec "$@"