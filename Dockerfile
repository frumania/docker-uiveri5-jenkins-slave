FROM openjdk:8-jdk

ARG CHROME_VERSION="google-chrome-stable"
ENV CHROMEDRIVER_VERSION "$(curl -sS https://chromedriver.storage.googleapis.com/LATEST_RELEASE)"

ARG NODE_VERSION="8.x"
ARG SELENIUM_URL="https://selenium-release.storage.googleapis.com/3.12/selenium-server-standalone-3.12.0.jar"
# CHROMEDRIVER_URL currently not used below
#ARG CHROMEDRIVER_URL="https://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip"
ARG CHROMELAUNCHER_URL="https://raw.githubusercontent.com/SeleniumHQ/docker-selenium/3.6.0-americium/NodeChrome/chrome_launcher.sh"
#ARG PHANTOMJS_URL="https://bitbucket.org/ariya/phantomjs/downloads"
ARG NODE_URL="https://deb.nodesource.com/setup_$NODE_VERSION"

USER root

# add chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -\
  && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list\
  && curl --silent --show-error --location $NODE_URL | bash - > /dev/null \
  && apt-get update -qqy \
  && apt-get install -qqy --no-install-recommends \
  ${CHROME_VERSION:-google-chrome-stable} \
  ca-certificates \
  libgconf2-4 \
  nodejs \
  sudo \
  xvfb \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

# ------------
# add selenium
# ------------
RUN  mkdir -p /opt/selenium\
  && wget --no-verbose $SELENIUM_URL -O /opt/selenium/selenium-server-standalone.jar

# ----------------
# add chromedriver
# ----------------
RUN rm -rf /opt/selenium/chromedriver\
  && export CHROMEDRIVER_DOWNLOAD_URL="https://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip" \
  && echo "wget --no-verbose $CHROMEDRIVER_DOWNLOAD_URL -O /opt/selenium/chromedriver_linux64.zip" > ./download.sh\
  && sh ./download.sh\
  && unzip /opt/selenium/chromedriver_linux64.zip -d /opt/selenium\
  && chmod 755 /opt/selenium/chromedriver\
  && ln -fs /opt/selenium/chromedriver /usr/bin/chromedriver

#=================================
# Chrome Launch Script Modication
#=================================
RUN curl --silent --show-error --location $CHROMELAUNCHER_URL > /opt/google/chrome/google-chrome

RUN  rm /opt/selenium/chromedriver_linux64.zip\
  && rm /etc/apt/sources.list.d/nodesource.list\
  && rm /etc/apt/sources.list.d/google-chrome.list\
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/*\
  && rm -f /tmp/.X*lock

COPY src/main/resources /opt/selenium

#RUN chown -R piper:piper /opt/selenium \
RUN chmod +x /opt/google/chrome/google-chrome \
#  && chmod +x /opt/selenium/startVisualTest.sh \
  && chmod +x /opt/selenium/startSeleniumServer.sh \
  && chmod +x /opt/selenium/start.sh \
  && chmod 755 /opt/selenium/chromedriver \
  # && usermod -aG sudo piper \
  # && echo 'ALL ALL = (ALL) NOPASSWD: ALL' >> /etc/sudoers \
  # && echo 'piper:secret' | chpasswd \
  # compatibility to icf/karma
  && mkdir /opt/bin \
  && ln -s /opt/selenium/start.sh /opt/bin/start.sh \
  && chmod +x /opt/bin/start.sh

# adapted from https://github.com/SeleniumHQ/docker-selenium/blob/master/NodeFirefox/Dockerfile
#=========
# Firefox
# "apt-get install firefox" could not find the package, instead uses firefox-esr
#=========
# ENV FIREFOX_VERSION=57.0
# RUN apt-get update -qqy \
#  && apt-get -qqy --no-install-recommends install firefox-esr \
#  && rm -rf /var/lib/apt/lists/* /var/cache/apt/* \
#  && wget --no-verbose -O /tmp/firefox.tar.bz2 https://download-installer.cdn.mozilla.net/pub/firefox/releases/$FIREFOX_VERSION/linux-x86_64/en-US/firefox-$FIREFOX_VERSION.tar.bz2 \
#  && apt-get -y purge firefox-esr \
#  && rm -rf /opt/firefox \
#  && tar -C /opt -xjf /tmp/firefox.tar.bz2 \
#  && rm /tmp/firefox.tar.bz2 \
#  && mv /opt/firefox /opt/firefox-$FIREFOX_VERSION \
#  && ln -fs /opt/firefox-$FIREFOX_VERSION/firefox /usr/bin/firefox

#============
# GeckoDriver
#============
# ARG GECKODRIVER_VERSION=0.19.1
# RUN wget --no-verbose -O /tmp/geckodriver.tar.gz https://github.com/mozilla/geckodriver/releases/download/v$GECKODRIVER_VERSION/geckodriver-v$GECKODRIVER_VERSION-linux64.tar.gz \
#  && rm -rf /opt/geckodriver \
#  && tar -C /opt -zxf /tmp/geckodriver.tar.gz \
#  && rm /tmp/geckodriver.tar.gz \
#  && mv /opt/geckodriver /opt/geckodriver-$GECKODRIVER_VERSION \
#  && chmod 755 /opt/geckodriver-$GECKODRIVER_VERSION \
#  && ln -fs /opt/geckodriver-$GECKODRIVER_VERSION /usr/bin/geckodriver

#USER piper

ENV SCREEN_WIDTH 1600
ENV SCREEN_HEIGHT 1200
ENV SCREEN_DEPTH 24
ENV DISPLAY :99.0
# should help preventing Chrome from hanging occasionally
ENV DBUS_SESSION_BUS_ADDRESS=/dev/null

#ENV PATH "/home/piper/bin:/home/piper/.npm-global/bin:$PATH"

ENV SELENIUM_CHROMEDRIVER_LOC /usr/bin/chromedriver
#ENV SELENIUM_GECKODRIVER_LOC /usr/bin/geckodriver

#RUN mkdir /home/piper/.npm-global \
RUN npm set loglevel warn \
  # && npm set prefix '/home/piper/.npm-global' \
  # && npm config set registry http://nexus.wdf.sap.corp:8081/nexus/content/groups/build.milestones.npm \
  && npm set strict-ssl false \
  && npm set progress false \
  # list config settings
  && npm config list
  # add phantomJS #EDIT MARCEL --unsafe-perm
  # && npm install --global phantomjs-prebuilt --unsafe-perm --phantomjs_cdnurl=$PHANTOMJS_URL

#============
# UIVERI5
#============

USER root

RUN npm install git -g --no-optional
RUN git config --global http.sslverify false
RUN npm install @ui5/uiveri5 -g --no-optional


#============
# DOCKER SLAVE
#============

COPY jenkins-slave /usr/local/bin/jenkins-slave

ENTRYPOINT ["jenkins-slave"];