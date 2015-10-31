FROM ubuntu:14.04.3
MAINTAINER Yosh de Vos "yosh@elzorro.nl"
ENV RELEASE_DATE 2015-10-18

# Install base packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -yq upgrade && \
    apt-get -yq install \
        php5-apcu \
        php5-cli \
        php5-curl \
        php5-fpm \
        php5-gd \
        php5-mcrypt \
        php5-mongo \
        php5-mysql \
        php5-intl \
        php5-json \
        php5-sqlite \
        php5-xsl \
        libssh2-php \
        git curl zip unzip vim gpsbabel acl && \
    rm -rf /var/lib/apt/lists/*

# Add locale
RUN locale-gen en_US.UTF-8

# Configure php-fpm
RUN sed -i 's/^listen .*/listen = 0.0.0.0:9000/' /etc/php5/fpm/pool.d/www.conf

#  Add php config overrides
ADD dist/php.ini /etc/php5/mods-available/overrides.ini

# Enable php modules
RUN php5enmod apcu curl gd mcrypt mongo mysql intl json sqlite3 ssh2 xsl overrides/99

# Install composer
RUN COMPOSER_HOME=/usr/local/composer curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

EXPOSE 9000
CMD ["php5-fpm", "-F"]
