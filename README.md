aveltens/tt-rss
=========

This image contains two tags, that combined allow to run [tiny-tiny-rss](https://tt-rss.org) and the update process on an apache webserver:

 - aveltens/tt-rss:updater
 - aveltens/tt-rss:apache

## aveltens/tt-rss:updater

A container from this image contains the tt-rss files and runs the update process, that will update the feeds.

It must be linked to a PostgreSQL database container with alias 'postgres'. MySQL is not supported.

Example docker run command:

`docker run --name my-tt-rss-updater -d -e SELF_URL_PATH=http://example.org/ --link my-ttrss-postgres:postgres aveltens/tt-rss:updater`

`SELF_URL_PATH`: Same as tiny-tiny-rss config variable named SELF_URL_PATH.

## aveltens/tt-rss:apache

A container from this image runs the apache webserver and hosts tiny-tiny-rss by including the volumes from the tt-rss:updater container.

It must be linked to a PostgreSQL database container with alias 'postgres'. MySQL is not supported.

It must include the volumes from the updater container.

Example docker run command:

`docker run --name my-tt-rss -d -p 80:80 -e SELF_URL_PATH=http://example.org/ --volumes-from my-tt-rss-updater --link my-ttrss-postgres:postgres aveltens/tt-rss:apache`

`SELF_URL_PATH`: Same as tiny-tiny-rss config variable named SELF_URL_PATH.

## Authentication

The image uses default credentials of tt-rss (username: admin, password: password).

**Go to preferences and change your password!**

## License

## Tiny Tiny RSS License

Free software, licensed under [GNU GPLv3](http://www.gnu.org/copyleft/gpl.html)

### License of the Dockerfile and associated files

The MIT License (MIT)

Copyright (c) 2015, Angelo Veltens

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.


