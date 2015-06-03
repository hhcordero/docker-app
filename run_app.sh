#!/bin/bash
docker run \
            --name docker_app \
            --publish 80:80 \
            --detach \
            hhcordero/docker-app
