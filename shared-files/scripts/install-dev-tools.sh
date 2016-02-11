#!/bin/bash

export DEBIAN_FRONTEND="noninteractive"

# Install ruby and various dev tools
apt-get update
apt-get -yq install --no-install-recommends \
    ruby2.0 ruby2.0-dev build-essential graphviz sshpass rsync \
    mysql-client postgresql-client dnsutils telnet bash-completion

# Install git aware prompt
curl https://codeload.github.com/jimeh/git-aware-prompt/zip/master > /tmp/git-aware-prompt-master.zip
unzip /tmp/git-aware-prompt-master.zip -d /usr/local
mv /usr/local/git-aware-prompt-master /usr/local/git-aware-prompt
rm /tmp/git-aware-prompt-master.zip
cat <<'EOF' >> /etc/skel/.bashrc

# Enable git-aware-prompt
export GITAWAREPROMPT=/usr/local/git-aware-prompt
if [ -d "$GITAWAREPROMPT" ]; then
    source "${GITAWAREPROMPT}/main.sh"
    export PS1="\${debian_chroot:+(\$debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
fi
EOF

# Configure ruby, update rubygems and install bundler and sass
update-alternatives --install /usr/bin/ruby ruby /usr/bin/ruby2.0 1
update-alternatives --install /usr/bin/gem gem /usr/bin/gem2.0 1
gem update --system
gem install bundler sass

# Install nodejs
curl -sL https://deb.nodesource.com/setup_5.x | bash -
apt-get -yq install nodejs
npm install -g npm@latest

# Install bower, grunt and gulp
npm install -g bower grunt-cli gulp

# Install drush, phing, phpunit and phpcs
curl -L http://files.drush.org/drush.phar > /usr/local/bin/drush
curl -L https://phar.phpunit.de/phpunit-old.phar > /usr/local/bin/phpunit
curl -L http://www.phing.info/get/phing-latest.phar > /usr/local/bin/phing
curl -L https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar > /usr/local/bin/phpcs
curl -L https://squizlabs.github.io/PHP_CodeSniffer/phpcbf.phar > /usr/local/bin/phpcbf
chmod 0755 /usr/local/bin/*

# Configure additional coding-standards directory
mkdir -p /usr/local/share/coding-standards
phpcs --config-set installed_paths /usr/local/share/coding-standards

# Install symfony2 code styling
curl -L https://github.com/escapestudios/Symfony2-coding-standard/archive/master.zip > /tmp/Symfony2-coding-standard.zip
unzip /tmp/Symfony2-coding-standard.zip -d /tmp/Symfony2-coding-standard
mv /tmp/Symfony2-coding-standard/Symfony2-coding-standard-master/Symfony2 /usr/local/share/coding-standards
rm -rf /tmp/Symfony2-coding-standard*

# Install drupal code styling
curl -L https://ftp.drupal.org/files/projects/coder-8.x-2.6.zip > /tmp/drupal-coder.zip
unzip /tmp/drupal-coder.zip -d /tmp/drupal-coder
mv /tmp/drupal-coder/coder/coder_sniffer/Drupal /usr/local/share/coding-standards
rm -rf /tmp/drupal-coder*

# Clean up
apt-get -y clean
rm -rf /var/lib/apt/lists/*
