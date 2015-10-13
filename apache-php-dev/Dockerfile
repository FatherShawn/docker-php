FROM yoshz/apache-php:5.5-1.2
MAINTAINER Yosh de Vos "yosh@elzorro.nl"
ENV RELEASE_DATE 2015-10-13

# Install supervisor, sshd, xdebug, ruby and various dev tools
RUN apt-get update && \
    apt-get -yq install supervisor openssh-server php5-xdebug ruby ruby-dev build-essential \
                acl graphviz sshpass wget && \
    mkdir -p /var/run/sshd

# Configure openssh server
ADD dist/ssh/* /etc/ssh2/

# Configure git
ADD dist/gitconfig /etc/gitconfig

# Configure php
RUN sed -i -e 's/^display_errors.*$/display_errors = On/' /etc/php5/apache2/php.ini /etc/php5/cli/php.ini

# Install bundler
RUN gem install rubygems-update bundler sass

# Install nodejs
RUN curl -sL https://deb.nodesource.com/setup | bash - && \
    apt-get -yq install nodejs

# Install bower, grunt and gulp
RUN npm install -g bower grunt-cli gulp uglify-js uglifycss

# Enable xdebug
RUN echo "xdebug.max_nesting_level=500" >> /etc/php5/mods-available/xdebug.ini && \
    php5enmod xdebug

# Install drush, phing, phpunit and phpcs
RUN export COMPOSER_HOME=/usr/local/composer && \
    composer global require drush/drush:6.5.0 phing/phing:2.* phpunit/phpunit:4.* squizlabs/php_codesniffer && \
    curl http://download.pear.php.net/package/Console_Table-1.1.3.tgz -o /tmp/Console_Table-1.1.3.tgz && \
    tar xzf /tmp/Console_Table-1.1.3.tgz -C /usr/local/composer/vendor/drush/drush/lib && \
    git clone git://github.com/escapestudios/Symfony2-coding-standard.git $COMPOSER_HOME/vendor/squizlabs/php_codesniffer/CodeSniffer/Standards/Symfony2 && \
    git clone --branch 7.x-2.x http://git.drupal.org/project/coder.git /tmp/coder && \
    cp -a /tmp/coder/coder_sniffer/Drupal $COMPOSER_HOME/vendor/squizlabs/php_codesniffer/CodeSniffer/Standards/ && \
    rm -rf /tmp/coder /tmp/Console_Table-1.1.3.tgz && \
    ln -s $COMPOSER_HOME/vendor/drush/drush/drush /usr/local/bin/drush && \
    ln -s $COMPOSER_HOME/vendor/bin/phing /usr/local/bin/phing && \
    ln -s $COMPOSER_HOME/vendor/bin/phpunit /usr/local/bin/phpunit && \
    ln -s $COMPOSER_HOME/vendor/bin/phpcs /usr/local/bin/phpcs

# Add verify_make drush module
RUN mkdir -p /usr/share/drush/commands && \
    curl https://raw.githubusercontent.com/insiders/drush-verify-make/master/verify_make.drush.inc -o /usr/share/drush/commands/verify_make.drush.inc

# Install sfnt2woff
RUN apt-get install -yq fontforge zlib1g-dev && \
    wget http://people.mozilla.com/~jkew/woff/woff-code-latest.zip -P /tmp && \
    unzip -o /tmp/woff-code-latest.zip -d /tmp/sfnt2woff && \
    make -C /tmp/sfnt2woff/ && \
    mv /tmp/sfnt2woff/sfnt2woff /usr/local/bin/ && \
    rm -rf /tmp/woff-code-latest.zip /tmp/sfnt2woff

# Cleanup apt cache
RUN rm -rf /var/lib/apt/lists/*

# Add supervisor configuration
ADD dist/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Add entrypoint script
ADD dist/dev-entrypoint.sh /entrypoint.sh
RUN chmod 0500 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

# Expose ssh and livereload
EXPOSE 22 35729

WORKDIR /var/www
CMD ["/usr/bin/supervisord"]
