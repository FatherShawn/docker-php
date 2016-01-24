FROM yoshz/php-fpm:7.0
MAINTAINER Yosh de Vos "yosh@elzorro.nl"

# Install v8js php extension
ADD dist/scripts/install-v8js.sh /install-v8js.sh
RUN sh /install-v8js.sh && rm /install-v8js.sh
