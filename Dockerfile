FROM hhcordero/docker-apache-php

MAINTAINER Hector Cordero <hhcordero@gmail.com>

# Update repository, install application and dependencies then clean-up after
RUN set -x \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install \
        imagemagick \
        php5-imagick \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy site vhost
COPY /conf/vhost.conf /etc/apache2/sites-available/000-default.conf

# Display php errors on dev
RUN sed -i "s/display_errors = Off/display_errors = On/g" /etc/php5/apache2/php.ini

EXPOSE 80
