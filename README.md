# Basic PHP website

Docker image to run basic PHP website on Apache (prefork) using Ubuntu Trusty. This image is referencing [hhcordero/docker-apache-php] (https://github.com/hhcordero/docker-apache-php) as the base image.

# Usage

Basic run parameter includes link with other container, assume mysql as the name of the other container and mount host ~/app to /app inside the container:

    docker run \
                --name docker_app \
                --publish 80:80 \
                --detach \
                hhcordero/docker-app
