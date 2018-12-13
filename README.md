# Uiveri5 Docker Slave for Jenkins

[![Build Status](https://travis-ci.org/frumania/docker-uiveri5-jenkins-slave.svg?branch=master)](https://travis-ci.org/frumania/docker-uiveri5-jenkins-slave)

[DockerHub](https://hub.docker.com/r/frumania/uiveri5-base/)

https://github.com/SAP/ui5-uiveri5

* openjdk:8-jdk
* linux x64
* Chrome (google-chrome-stable) 71.0.3578.80
* ChromeDriver 2.45.615279
* Selenium 3.12.0
* **Visualtest (Uiveri5) 1.35.3**
* npm 6.4.1
* node v8.14.0
* jnlp (jenkins-slave)

## Test locally

> docker run -it frumania/uiveri5-base:latest bash

## Usage with Jenkins (Docker Plugin)

[Docker Plugin for Jenkins](https://plugins.jenkins.io/docker-plugin)

Connect method: Attach Docker container

## Usage with Uiveri5

> /opt/selenium/startSeleniumServer.sh

> visualtest --seleniumAddress http://localhost:4444/wd/hub ...

## Update local repository

> docker pull frumania/uiveri5-base:latest

[Guide](https://www.techrepublic.com/article/how-to-create-a-docker-image-and-push-it-to-docker-hub/)

> docker build --no-cache -t frumania/uiveri5-base:latest .

> docker run --name myslave -it frumania/uiveri5-base:latest bash

> exit

> docker login ...

> docker commit -m "update" -a "NAME" myslave frumania/uiveri5-base:latest

> docker push frumania/uiveri5-base

## Cleanup

> docker container rm <\ContainerID\>

> docker image rm <\ImageID\>

## License

[![Apache 2](https://img.shields.io/badge/license-Apache%202-blue.svg)](./LICENSE.txt)