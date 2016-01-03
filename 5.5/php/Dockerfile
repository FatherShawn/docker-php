FROM phusion/baseimage
MAINTAINER Yosh de Vos "yosh@elzorro.nl"
ENV RELEASE_DATE 2016-01-03

# Install php and base packages
RUN export DEBIAN_FRONTEND="noninteractive" && \
    apt-get update && \
    apt-get -yq upgrade && \
    apt-get -yq install --no-install-recommends \
        php5-apcu \
        php5-cli \
        php5-curl \
        php5-gd \
        php5-mcrypt \
        php5-mongo \
        php5-mysql \
        php5-intl \
        php5-json \
        php5-sqlite \
        git curl zip unzip acl && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* && \
    php5enmod apcu curl gd mcrypt mongo mysql intl json sqlite3

# Install composer
RUN COMPOSER_HOME=/usr/local/composer curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Run tests
ADD dist/tests/php55.sh /test.sh
RUN /test.sh
