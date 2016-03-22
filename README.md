# Cockpit Docker Image
[![Build Status](https://travis-ci.org/aheinze/cockpit-docker.svg?branch=master)](https://travis-ci.org/aheinze/cockpit-docker)
[![Docker Stars](https://img.shields.io/docker/stars/aheinze/cockpit.svg)]()
[![Docker Pulls](https://img.shields.io/docker/pulls/aheinze/cockpit.svg)]()
[![](https://img.shields.io/github/issues-raw/aheinze/cockpit-docker.svg)]()

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
