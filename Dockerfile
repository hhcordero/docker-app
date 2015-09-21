FROM hhcordero/docker-apache-php

MAINTAINER Hector Cordero <hhcordero@gmail.com>

# Update repository, install application and dependencies then clean-up after
RUN set -x \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install \
        imagemagick \
        php5-imagick \
    && pecl channel-update pecl.php.net \
    && echo -e "; configuration for php oauth module\n; priority=30\nextension=oauth.so" > /etc/php5/mods-available/oauth.ini \
    && pear config-set php_ini /etc/php5/mods-available/oauth.ini \
    && pecl install oauth \
    && php5enmod oauth \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy site vhost
COPY /conf/vhost.conf /etc/apache2/sites-available/000-default.conf

# Display php errors on dev
RUN sed -i "s/display_errors = Off/display_errors = On/g" /etc/php5/apache2/php.ini

EXPOSE 80
