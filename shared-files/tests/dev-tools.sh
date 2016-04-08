#!/bin/bash

echo --- Tests ---

#echo -n "Checking if xdebug is installed... "
#php -i | grep -i "xdebug support => enabled" > /dev/null
#[ "$?" -ne 0 ] && echo "Failed" && exit 1
#echo ok

echo -n "Checking if ruby 2.0 is installed... "
ruby --version | grep -i "ruby 2.0" > /dev/null
[ "$?" -ne 0 ] && echo "Failed" && exit 1
echo ok

echo -n "Checking if bundler is installed... "
ruby --version > /dev/null
[ "$?" -ne 0 ] && echo "Failed" && exit 1
echo ok

echo -n "Checking if sass is installed... "
sass --version > /dev/null
[ "$?" -ne 0 ] && echo "Failed" && exit 1
echo ok

echo -n "Checking if bower is installed... "
bower --version > /dev/null
[ "$?" -ne 0 ] && echo "Failed" && exit 1
echo ok

echo -n "Checking if grunt is installed... "
grunt --version > /dev/null
[ "$?" -ne 0 ] && echo "Failed" && exit 1
echo ok

echo -n "Checking if gulp is installed... "
gulp --version > /dev/null
[ "$?" -ne 0 ] && echo "Failed" && exit 1
echo ok

echo -n "Checking if phing is installed... "
phing -version > /dev/null
[ "$?" -ne 0 ] && echo "Failed" && exit 1
echo ok

echo -n "Checking if phpunit is installed... "
phpunit --version > /dev/null
[ "$?" -ne 0 ] && echo "Failed" && exit 1
echo ok

echo -n "Checking if phpcs is installed... "
phpcs --version > /dev/null
[ "$?" -ne 0 ] && echo "Failed" && exit 1
echo ok

echo -n "Checking if drush is installed... "
drush --version > /dev/null
[ "$?" -ne 0 ] && echo "Failed" && exit 1
echo ok

echo -n "Checking if behat is installed... "
behat --version > /dev/null
[ "$?" -ne 0 ] && echo "Failed" && exit 1
echo ok
