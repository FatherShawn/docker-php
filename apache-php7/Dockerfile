FROM ubuntu:14.04.2
MAINTAINER Yosh de Vos "yosh@elzorro.nl"
ENV RELEASE_DATE 2015-06-21

# Install base packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -yq upgrade && \
    apt-get -yq install \
        mysql-client \
        apache2 \
        libxml2 \
        openssl \
        libssl1.0.0 \
        libcurl3 \
        libbz2-1.0 \
        libgdbm3 \
        libjpeg62 \
        libjpeg62 \
        libpng12-0 \
        libfreetype6 \
        libicu52 \
        libxslt1.1 \
        libedit2 \
        libmcrypt4 \
        git curl zip unzip vim gpsbabel acl && \
    rm -rf /var/lib/apt/lists/*

# Add php7 binaries
ADD dist/etc /etc
ADD dist/usr /usr
RUN ln -s /usr/php7/bin/php /usr/bin/php
RUN mkdir /var/lock/apache2

# Create missing directories
RUN mkdir -p /var/lock/apache2 /var/run/apache2

# Add locale
RUN locale-gen en_US.UTF-8

# Enable apache modules
RUN a2dismod mpm_event && \
    a2enmod mpm_prefork rewrite vhost_alias headers ssl php7

# Add php handler
ADD dist/php7.conf /etc/apache2/conf-enabled/php7.conf

# Add apache default vhost configuration
ADD dist/default-vhost.conf /etc/apache2/sites-available/000-default.conf

#  Add php config overrides
ADD dist/php.ini /etc/php7/conf.d/overrides.ini

# Install composer
RUN COMPOSER_HOME=/usr/local/composer curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install dockerize
RUN curl -sSL https://github.com/jwilder/dockerize/releases/download/v0.0.2/dockerize-linux-amd64-v0.0.2.tar.gz | tar -C /usr/local/bin -xzf -

# Add run file
ADD dist/apache-run.sh /apache-run.sh
RUN chmod 0500 /apache-run.sh

EXPOSE 80 443
CMD ["/apache-run.sh"]
