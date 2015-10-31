#!/bin/bash

echo --- Tests ---

echo -n "Checking if PHP 7.0 is installed... "
php --version | grep "PHP 7.0" > /dev/null
[ "$?" -ne 0 ] && echo "Failed" && exit 1
echo ok

echo -n "Checking if composer is installed... "
composer --version > /dev/null
[ "$?" -ne 0 ] && echo "Failed" && exit 1
echo ok
