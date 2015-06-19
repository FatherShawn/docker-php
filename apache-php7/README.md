Apache PHP Docker image
=======================

A Docker image based on Ubuntu 14.04 installed with:

* Apache 2.4.7 with enabled modules:
  * mod_rewrite
  * mod_php5
  * mod_vhost_alias
  * mod_headers
  * mod_ssl
* PHP 7.0.0-dev with enabled extensions:
  * curl
  * gd
  * mcrypt
  * mongo
  * mysql
  * intl
  * json
  * sqlite
  * xsl
* Composer 1.0-dev


Download image
--------------

This image is available on [Docker Hub Registry](https://registry.hub.docker.com/u/yoshz/apache-php/).

    docker pull yoshz/apache-php:7.0


Start a new container
---------------------

To start a new container run:

    docker run -p 80:80 \
        -v www:/var/www \
        yoshz/apache-php:7.0

By default the document root will point to `/var/www/html`.


Custom vhost configuration
--------------------------

You can specify your own vhosts by add a `sites-enabled` volume:

    docker run -p 80:80 \
        -v sites-enabled:/etc/apache2/sites-enabled \
        -v /opt/www:/var/www \
        yoshz/apache-php:7.0

Place your vhost apache configuration files in `sites-enabled`.


Contact
-------

For issues, questions or more docker images go to:
[https://github.com/yoshz/docker-php](https://github.com/yoshz/docker-php)

