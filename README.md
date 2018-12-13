# ui5-uiveri5 Docker Slave for Jenkins

[![Build Status](https://travis-ci.org/frumania/docker-uiveri5-jenkins-slave.svg?branch=master)](https://travis-ci.org/frumania/docker-uiveri5-jenkins-slave)

[DockerHub](https://hub.docker.com/r/frumania/uiveri5-base/)


* **Visualtest [ui5 uiveri5](https://github.com/SAP/ui5-uiveri5) 1.35.3**
* openjdk:8-jdk
* linux x64
* Chrome (google-chrome-stable) 71.0.3578.80
* ChromeDriver 2.45.615279
* Selenium 3.12.0
* npm 6.4.1
* node v8.14.0
* jnlp (jenkins-slave)

## Usage

Install/Download Docker from [docker.com](https://www.docker.com/get-started).

### Run

Via terminal/cmd, execute  
> docker run -it frumania/uiveri5-base:latest bash

## Usage with Jenkins (Docker Plugin)

[Docker Plugin for Jenkins](https://plugins.jenkins.io/docker-plugin)

Connect method: Attach Docker container

## Usage with Uiveri5

Via terminal/cmd, execute   
> /opt/selenium/startSeleniumServer.sh

> visualtest --seleniumAddress http://localhost:4444/wd/hub ...

### (Optional) Build locally

Only required, if you would like to **make changes** to the image!  

Via terminal/cmd, execute  
> git clone https://github.com/frumania/docker-uiveri5-jenkins-slave.git  

> cd docker-uiveri5-jenkins-slave

> docker build -t docker-uiveri5-jenkins-slave:latest .

### (Optional) Update Image

[Guide](https://www.techrepublic.com/article/how-to-create-a-docker-image-and-push-it-to-docker-hub/)

Pull Image  
> docker pull frumania/uiveri5-base:latest

Build Image  
> docker build --no-cache -t frumania/uiveri5-base:latest .

Run initially  
> docker run --name myslave -it frumania/uiveri5-base:latest bash

> exit

> docker login ...

Commit  
> docker commit -m "update" -a "NAME" myslave frumania/uiveri5-base:latest

Push  
> docker push frumania/uiveri5-base

## Useful Commands

### Start/Stop

Check container status
> docker ps

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