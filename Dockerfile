FROM php:5.5-apache
MAINTAINER Angelo Veltens <angelo.veltens@online.de>

RUN apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y

RUN apt-get install git -y

# install tt-rss
RUN git clone https://tt-rss.org/git/tt-rss.git .

# install php modules & configure php
RUN docker-php-ext-install mbstring


COPY configure.sh /configure.sh

ENTRYPOINT /configure.sh

CMD ["apache2-foreground"]