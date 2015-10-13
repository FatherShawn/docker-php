FROM yoshz/apache-php:5.5
MAINTAINER Yosh de Vos "yosh@elzorro.nl"
ENV RELEASE_DATE 2015-10-13

# Install composer and drush
RUN export COMPOSER_HOME=/usr/local/composer && \
    composer global require drush/drush:6.5.0 && \
    composer global install && \
    ln -s /usr/local/composer/vendor/drush/drush/drush /usr/local/bin/drush

# Fix drush dependency
ADD http://download.pear.php.net/package/Console_Table-1.1.3.tgz /tmp/
RUN tar xzf /tmp/Console_Table-1.1.3.tgz -C /usr/local/composer/vendor/drush/drush/lib && \
    rm /tmp/Console_Table-1.1.3.tgz

# Add verify_make drush module
RUN mkdir -p /usr/share/drush/commands && \
    curl https://raw.githubusercontent.com/insiders/drush-verify-make/master/verify_make.drush.inc -o /usr/share/drush/commands/verify_make.drush.inc
