FROM php:5.5-apache
MAINTAINER Angelo Veltens <angelo.veltens@online.de>

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get dist-upgrade -y

# install dependencies
RUN apt-get install -y libcurl4-openssl-dev \
                       libpng12-dev \
                       libpq-dev \
                       postgresql-client


# install php modules & configure php
RUN docker-php-ext-install mbstring json curl gd pgsql
