FROM yoshz/php:5.5
MAINTAINER Yosh de Vos "yosh@elzorro.nl"

# Install v8js php extension
ADD install-v8js.sh /install-v8js.sh
RUN sh /install-v8js.sh

# Enable v8js php extension
RUN php5enmod v8js