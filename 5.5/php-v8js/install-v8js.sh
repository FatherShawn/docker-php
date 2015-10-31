#!/bin/bash

export DEBIAN_FRONTEND="noninteractive"
apt-get update
apt-get -y install --no-install-recommends git subversion make g++ python curl php5-dev chrpath

# depot tools
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git /usr/local/depot_tools
export PATH=$PATH:/usr/local/depot_tools

# download v8
cd /usr/local/src && fetch v8

# compile v8
cd /usr/local/src/v8 && make native library=shared snapshot=off -j4

# install v8
mkdir -p /usr/local/lib
cp /usr/local/src/v8/out/native/lib.target/lib*.so /usr/local/lib
echo "create /usr/local/lib/libv8_libplatform.a\naddlib /usr/local/src/v8/out/native/obj.target/tools/gyp/libv8_libplatform.a\nsave\nend" | ar -M
cp -R /usr/local/src/v8/include /usr/local
chrpath -r '$ORIGIN' /usr/local/lib/libv8.so

# get v8js, compile and install
git clone https://github.com/preillyme/v8js.git /usr/local/src/v8js
cd /usr/local/src/v8js && phpize && ./configure --with-v8js=/usr/local
export NO_INTERACTION=1
cd /usr/local/src/v8js && make all test install

# autoload v8js.so
echo extension=v8js.so > /etc/php5/mods-available/v8js.ini

# cleanup
apt-get -y purge git subversion make g++ binutils bsdmainutils python curl php5-dev php-pear chrpath rsync cpp
apt-get -y autoremove --purge
apt-get -y clean
rm -rf /root/.cache /var/lib/apt/lists/* /usr/local/src /usr/local/depot_tools