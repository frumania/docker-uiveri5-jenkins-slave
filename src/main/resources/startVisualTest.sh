#!/bin/bash

source /opt/selenium/functions.sh

echo
echo "--- Install visualtestjs"
echo
npm install $VISUALTEST_REPO#$VISUALTEST_VERSION -g --no-optional

if [ ! -z "$VISUALTEST_EXTENSION_DIR" ]; then
    echo
    echo "--- Install visualtest extensions"
    echo
    cd $VISUALTEST_EXTENSION_DIR; npm install; cd -;
fi

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

if [ "$USE_SELENIUM_JAR" == "TRUE" ]; then
    echo
    echo "--- Starting selenium server"
    echo
    java -Dwebdriver.chrome.driver=/opt/selenium/chromedriver -jar /opt/selenium/selenium-server-standalone.jar -browserSideLog -debug -timeout 60 &
else
    echo "--- Skipped startup of selenium server"
fi

echo
echo "--- Execute command"
echo
exec visualtest "$@"

#execute with parameters like
# startVisualTestJs.sh visualtest --seleniumAddress http://0.0.0.0:4444/wd/hub
