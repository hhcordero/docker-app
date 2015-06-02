#!/bin/bash
docker run \
            --name docker_app \
            --volume ~/docker-app/src:/app \
            --publish 80:80 \
            --detach \
            hhcordero/docker-app
