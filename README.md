# SAPUI5 UIVeri5 Docker Image + Slave for Jenkins

[![Build Status](https://travis-ci.org/frumania/docker-uiveri5-jenkins-slave.svg?branch=master)](https://travis-ci.org/frumania/docker-uiveri5-jenkins-slave)

This image can be used for integration testing based on [UIVeri5](https://github.com/SAP/ui5-uiveri5) and headless chrome. It is also preconfigured to be used as Jenkins slave for SAP Fiori CI processes.

* **[ui5-uiveri5](https://github.com/SAP/ui5-uiveri5) v1.39.0**
* openjdk:8-jdk
* linux x64
* Chrome (google-chrome-stable) 74.0.3729.131
* ChromeDriver 74.0.3729.6
* Selenium 3.12
* npm 6.4.1
* node v8.15.0
* jnlp (jenkins-slave)

See also [DockerHub](https://hub.docker.com/r/frumania/uiveri5-base/)

## Usage

Install/Download Docker from [docker.com](https://www.docker.com/get-started).

### Run / Test

Via terminal/cmd, execute

Start Image/Create Container
```bash
$ docker run --name myslave -dit frumania/uiveri5-base:latest /bin/bash
```

Start Selenium Server
```bash
docker exec -d myslave /opt/selenium/startSeleniumServer.sh
```

Run uiveri5 test
```bash
docker exec myslave uiveri5 --v --seleniumAddress http://localhost:4444/wd/hub ...
```

## Run via Jenkins (Docker Plugin)

[Docker Plugin for Jenkins](https://plugins.jenkins.io/docker-plugin)

Connect method: Attach Docker container

![docker_config](https://github.com/frumania/docker-uiveri5-jenkins-slave/blob/master/docs/img/docker_config.png)

### (Optional) Build locally

Only required, if you would like to **make changes** to the image!  

Via terminal/cmd, execute
```bash
git clone https://github.com/frumania/docker-uiveri5-jenkins-slave.git  
```

```bash
cd docker-uiveri5-jenkins-slave
```

```bash
docker build -t uiveri5-base:latest .
```

## Useful Commands

### Start/Stop

List containers / check container status
```bash
docker ps -a
```

Stop container
```bash
docker stop <ContainerID>  
```

Start container
```bash
docker start <ContainerID>  
```

### Cleanup

Stop container
```bash
docker stop <ContainerID>  
```

Remove container
```bash
$ docker container rm <ContainerID>  
```

List images
```bash
$ docker images  
```

Removes docker image
```bash
$ docker image rm <ImageID>  
```

### Troubleshooting

Display Logs
```bash
$ docker logs <ContainerID>  
```

Enter container
```bash
$ docker exec -it <ContainerID> bash 
```

## Support & Contribution

This project is provided "as-is". There is no guarantee that raised issues will be answered or addressed in future releases.

If you like to contribute, fork the code and/or let me know!

## License

[![Apache 2](https://img.shields.io/badge/license-Apache%202-blue.svg)](./LICENSE.txt)
