# ui5-uiveri5 Docker Slave for Jenkins

[![Build Status](https://travis-ci.org/frumania/docker-uiveri5-jenkins-slave.svg?branch=master)](https://travis-ci.org/frumania/docker-uiveri5-jenkins-slave)

This image can be used for integration testing based on uiveri5 and headless chrome. It is also preconfigured to be used as Jenkins slave for SAP Fiori CI processes.

* **Visualtest / [ui5-uiveri5](https://github.com/SAP/ui5-uiveri5) 1.35.3**
* openjdk:8-jdk
* linux x64
* Chrome (google-chrome-stable) 71.0.3578.80
* ChromeDriver 2.45.615279
* Selenium 3.12.0
* npm 6.4.1
* node v8.14.0
* jnlp (jenkins-slave)

See also [DockerHub](https://hub.docker.com/r/frumania/uiveri5-base/)

## Usage

Install/Download Docker from [docker.com](https://www.docker.com/get-started).

### Run / Test

Via terminal/cmd, execute

Start Image/Create Container
> docker run --name myslave -dit frumania/uiveri5-base:latest /bin/bash

Start Selenium Server
> docker exec -d myslave /opt/selenium/startSeleniumServer.sh

Run uiveri5 test
> docker exec myslave visualtest --v --seleniumAddress http://localhost:4444/wd/hub ...

## Run via Jenkins (Docker Plugin)

[Docker Plugin for Jenkins](https://plugins.jenkins.io/docker-plugin)

Connect method: Attach Docker container

![docker_config](https://github.com/frumania/docker-uiveri5-jenkins-slave/blob/master/docs/img/docker_config.png)

### (Optional) Build locally

Only required, if you would like to **make changes** to the image!  

Via terminal/cmd, execute  
> git clone https://github.com/frumania/docker-uiveri5-jenkins-slave.git  

> cd docker-uiveri5-jenkins-slave

> docker build -t docker-uiveri5-jenkins-slave:latest .

## Useful Commands

### Start/Stop

List containers / check container status
> docker ps -a

Stop container
> docker stop <ContainerID\>  

Start container
> docker start <ContainerID\>  

### Cleanup

Stop container
> docker stop <ContainerID\>  

Remove container
> docker container rm <ContainerID\>  

List images
> docker images  

Removes docker image
> docker image rm <ImageID\>  

### Troubleshooting

Display Logs
> docker logs <ContainerID\>  

Enter container
> docker exec -it <ContainerID\> bash  

## License

[![Apache 2](https://img.shields.io/badge/license-Apache%202-blue.svg)](./LICENSE.txt)