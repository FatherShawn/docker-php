FROM ubuntu:14.04.2
MAINTAINER Yosh de Vos "yosh@elzorro.nl"
ENV RELEASE_DATE 2015-06-21

ADD php-src /tmp/php-src
WORKDIR /tmp/php-src

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -yq upgrade

RUN apt-get -yq install \
    autoconf \
    bison \
    libxml2-dev \
    apache2-dev \
    systemtap-sdt-dev \
    openssl \
    pkg-config \
    libssl-dev \
    libcurl4-openssl-dev \
    libbz2-dev \
    libgdbm-dev \
    libjpeg62 \
    libjpeg62-dev \
    libpng12-0 \
    libpng12-dev \
    libfreetype6-dev \
    libicu-dev \
    libiodbc2-dev \
    libxslt1-dev \
    libedit-dev \
    libmcrypt-dev

RUN ./buildconf

RUN ./configure \
    --with-libdir=lib/x86_64-linux-gnu \
    --prefix=/usr/php7 \
    --sysconfdir=/etc/php7 \
    --with-config-file-path=/etc/php7 \
    --with-config-file-scan-dir=/etc/php7/conf.d \
    --enable-bcmath \
    --enable-calendar \
    --enable-exif \
    --enable-ftp \
    --enable-gd-native-ttf \
    --enable-intl \
    --enable-mbregex \
    --enable-mbstring \
    --enable-shmop \
    --enable-soap \
    --enable-sockets \
    --enable-sysvmsg \
    --enable-sysvsem \
    --enable-sysvshm \
    --enable-wddx \
    --enable-zip \
    --with-curl=/usr \
    --with-freetype-dir=/usr \
    --with-gd \
    --with-gettext=/usr \
    --with-iconv-dir=/usr \
    --with-icu-dir=/usr \
    --with-jpeg-dir=/usr \
    --with-kerberos=/usr \
    --with-libedit \
    --with-mcrypt=/usr \
    --with-mhash \
    --with-openssl=/usr \
    --with-png-dir=/usr \
    --with-xmlrpc \
    --with-zlib=/usr \
    --with-apxs2=/usr/bin/apxs \
    --libexecdir=/usr/php7/libexec \
    --with-bz2=/usr \
    --disable-debug \
    --enable-fpm \
    --with-fpm-user=_www \
    --with-fpm-group=_www \
    --with-curl \
    --with-xsl=/usr \
    --with-mysql-sock=/tmp/mysql.sock \
    --with-mysqli=mysqlnd \
    --with-pdo-mysql=mysqlnd \
    --disable-opcache \
    --enable-pcntl \
    --enable-dtrace \
    --disable-phpdbg \
    --enable-zend-signals

RUN make

RUN apt-get -yq install apache2
RUN make install
RUN rm -rf /tmp/php-src

RUN a2dismod mpm_event && \
    a2enmod mpm_prefork

# Add run file
ADD apache-run.sh /apache-run.sh
RUN chmod 0500 /apache-run.sh

EXPOSE 80 443
CMD ["/apache-run.sh"]
