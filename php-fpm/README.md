PHP-FPM Docker image
====================

A Docker image based on Ubuntu 14.04 installed with:

* PHP-FPM 5.5.9 with enabled extensions:
  * apcu
  * curl
  * gd
  * mcrypt
  * mongo
  * mysql
  * intl
  * json
  * sqlite
  * ssh2
  * xsl
* Composer 1.0-dev


Download image
--------------

This image is available on [Docker Hub Registry](https://registry.hub.docker.com/u/yoshz/php-fpm/).

    docker pull yoshz/php-fpm:5.5


Start a new container
---------------------

To start a new container run:

    docker run -p 8000:80 \
        -v www:/var/www \
        yoshz/php-fpm:5.5


Contact
-------

For issues, questions or more docker images go to:
[https://github.com/yoshz/docker-php](https://github.com/yoshz/docker-php)

