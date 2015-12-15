#!/bin/bash

export DEBIAN_FRONTEND="noninteractive"
export COMPOSER_HOME=/usr/local/composer

# Install ruby and various dev tools
apt-get update
apt-get -yq install --no-install-recommends \
    ruby2.0 ruby2.0-dev build-essential graphviz sshpass rsync

# Configure ruby and install bundler and sass
update-alternatives --install /usr/bin/ruby ruby /usr/bin/ruby2.0 1
update-alternatives --install /usr/bin/gem gem /usr/bin/gem2.0 1
gem install bundler sass

# Install nodejs
curl -sL https://deb.nodesource.com/setup | bash -
apt-get -yq install nodejs

# Install bower, grunt and gulp
npm install -g bower grunt-cli gulp

# Install drush, phing, phpunit and phpcs
composer global require drush/drush:6.5.* phing/phing:2.* phpunit/phpunit:4.* squizlabs/php_codesniffer
ln -s $COMPOSER_HOME/vendor/drush/drush/drush /usr/local/bin/drush
ln -s $COMPOSER_HOME/vendor/bin/phing /usr/local/bin/phing
ln -s $COMPOSER_HOME/vendor/bin/phpunit /usr/local/bin/phpunit
ln -s $COMPOSER_HOME/vendor/bin/phpcs /usr/local/bin/phpcs

# Add symfony2 code styling
git clone git://github.com/escapestudios/Symfony2-coding-standard.git /tmp/Symfony2-coding-standard
cp -a /tmp/Symfony2-coding-standard/Symfony2 $COMPOSER_HOME/vendor/squizlabs/php_codesniffer/CodeSniffer/Standards/
rm -rf /tmp/Symfony2-coding-standard

# Add drupal code styling
git clone --branch 7.x-2.x http://git.drupal.org/project/coder.git /tmp/coder
cp -a /tmp/coder/coder_sniffer/Drupal $COMPOSER_HOME/vendor/squizlabs/php_codesniffer/CodeSniffer/Standards/
rm -rf /tmp/coder

# Clean up
apt-get -y clean
rm -rf /var/lib/apt/lists/*