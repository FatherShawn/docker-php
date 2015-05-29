FROM ubuntu:14.04.2
MAINTAINER Yosh de Vos "yosh@elzorro.nl"

# Install base packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -yq upgrade && \
    apt-get -yq install \
        mysql-client \
        apache2 \
        libapache2-mod-php5 \
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
        php5-xsl \
        libssh2-php \
        git curl zip unzip vim gpsbabel acl && \
    rm -rf /var/lib/apt/lists/*

# Add locale
RUN locale-gen en_US.UTF-8

# Add apache default vhost configuration
ADD default-vhost.conf /etc/apache2/sites-available/000-default.conf

# Enable apache modules
RUN a2enmod rewrite php5 vhost_alias headers ssl

#  Add php config overrides
ADD php.ini /etc/php5/mods-available/overrides.ini

# Enable php modules
RUN php5enmod apcu curl gd mcrypt mongo mysql intl json sqlite3 ssh2 xsl overrides/99

# Install composer
RUN COMPOSER_HOME=/usr/local/composer curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install dockerize
RUN curl -sSL https://github.com/jwilder/dockerize/releases/download/v0.0.2/dockerize-linux-amd64-v0.0.2.tar.gz | tar -C /usr/local/bin -xzf -

# Add run file
ADD apache-run.sh /apache-run.sh
RUN chmod 0500 /apache-run.sh

EXPOSE 80 443
CMD ["/apache-run.sh"]
