FROM php:5.5-apache
MAINTAINER Angelo Veltens <angelo.veltens@online.de>

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get dist-upgrade -y

# install dependencies
RUN apt-get install -y  git \
                        libcurl4-openssl-dev \
                        libpng12-dev \
                        libpq-dev \
                        postgresql-client

# install php modules & configure php
RUN docker-php-ext-install mbstring json curl gd pgsql

# install tt-rss
RUN git clone https://tt-rss.org/git/tt-rss.git .

# add config
COPY config.php ./config.php-dist

# adjust file permissions
RUN chown www-data:www-data cache/images cache/upload cache/export cache/js feed-icons lock

# add and define entrypoint
COPY init-db.sh /
ENTRYPOINT ["/init-db.sh"]

CMD ["apache2-foreground"]