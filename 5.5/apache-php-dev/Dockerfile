FROM yoshz/apache-php:5.5
MAINTAINER Yosh de Vos "yosh@elzorro.nl"

# Install base packages
RUN export DEBIAN_FRONTEND="noninteractive" && \
    apt-get update && \
    apt-get -yq upgrade && \
    apt-get -yq install --no-install-recommends \
        mysql-client \
        php5-xdebug && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/*

# Configure ssh
RUN rm -f /etc/service/sshd/down
ADD dist/ssh/* /etc/ssh/

# Configure git
ADD dist/configs/gitconfig /etc/gitconfig

# Display php errors
RUN sed -i -e 's/^display_errors.*$/display_errors = On/' /etc/php5/apache2/php.ini /etc/php5/cli/php.ini

# Install and enable xdebug
RUN echo "xdebug.max_nesting_level=500" > /etc/php5/mods-available/xdebug.ini && \
    echo "alias php='php -dzend_extension=xdebug.so'\nalias phpunit='php /usr/local/bin/phpunit'" >> /etc/bash.bashrc && \
    php5enmod xdebug

# Install development tools
ADD dist/scripts/install-dev-tools.sh /install-dev-tools.sh
RUN /install-dev-tools.sh && rm /install-dev-tools.sh

# Run tests
ADD dist/tests/dev-tools.sh /test.sh
RUN /test.sh

# Add entrypoint script
ADD dist/scripts/dev-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/sbin/my_init"]

# Expose ssh and livereload
EXPOSE 22 35729

WORKDIR /var/www
