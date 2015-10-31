FROM yoshz/php-fpm:5.5
MAINTAINER Yosh de Vos "yosh@elzorro.nl"

# Install development tools
ADD dist/scripts/install-dev-tools.sh /install-dev-tools.sh
RUN /install-dev-tools.sh && rm /install-dev-tools.sh

# Display php errors
RUN sed -i -e 's/^display_errors.*$/display_errors = On/' /etc/php5/fpm/php.ini /etc/php5/cli/php.ini

# Enable openssh server
RUN rm -f /etc/service/sshd/down

# Configure git
ADD dist/configs/gitconfig /etc/gitconfig

# Run tests
ADD dist/tests/dev-tools.sh /test.sh
RUN /test.sh && rm /test.sh

# Add entrypoint script
ADD dist/scripts/dev-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/sbin/my_init"]

# Expose ssh and livereload
EXPOSE 22 35729

WORKDIR /var/www
