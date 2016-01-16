FROM php:5.5-apache
MAINTAINER Angelo Veltens <angelo.veltens@online.de>

RUN apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y

RUN apt-get install git libcurl4-openssl-dev libpng12-dev libpq-dev -y

# install php modules & configure php
RUN docker-php-ext-install mbstring json curl gd pdo_pgsql

# install tt-rss
RUN git clone https://tt-rss.org/git/tt-rss.git .

COPY config.php .

RUN chown www-data:www-data cache/images cache/upload cache/export cache/js feed-icons lock