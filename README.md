# Cockpit Docker Image
Repository for maintaining the Docker image of Cockpit. See more at [Dockerhub](https://hub.docker.com/r/aheinze/cockpit/)

# Usage
Start a container with:

    docker run -d --name cockpit -p 8080:80 aheinze/cockpit

or with Docker compose:
```yml
cockpit:
  image: aheinze/cockpit
  ports:
    - 8080:80
```
# Build
To build the image use the Makefile. It will automatically fetch the latest
version of Cockpit and tag the Docker image properly:

    make

# Test
After building the image, test the webservice in http://DOCKER_IP:8080 with:

    docker-compose up
