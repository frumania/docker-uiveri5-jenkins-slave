# Docker Slave for Jenkins

* Chrome 'google-chrome-stable 71.0.3578.80'
* ChromeDriver '2.44'
* Selenium '3.12.0'
* Visualtest (uiveri5) '1.35.3'
* npm/6.4.1 node/v8.14.0 linux x64

# INSTALLATION

docker build --no-cache -t frumania/uiveri5-base:latest .

# TEST

docker run -d frumania/uiveri5-base:latest

# UPDATE REPO

docker build --no-cache -t frumania/uiveri5-base:latest .

docker run --name myslave -it frumania/uiveri5-base:latest bash
exit

docker commit -m "update" -a "NAME" myslave frumania/uiveri5-base:latest

docker push frumania/uiveri5-base

https://hub.docker.com/r/frumania/uiveri5-base/
https://www.techrepublic.com/article/how-to-create-a-docker-image-and-push-it-to-docker-hub/
docker container rm <containerID>
docker rmi <ImageID>