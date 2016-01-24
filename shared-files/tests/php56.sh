#!/bin/bash

echo --- Tests ---

echo -n "Checking if PHP 5.6 is installed... "
php --version | grep "PHP 5.6" > /dev/null
[ "$?" -ne 0 ] && echo "Failed" && exit 1
echo ok

echo -n "Checking if composer is installed... "
composer --version > /dev/null
[ "$?" -ne 0 ] && echo "Failed" && exit 1
echo ok
