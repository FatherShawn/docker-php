#!/bin/bash

echo --- Tests ---

echo -n "Checking if PHP FPM is correctly configured... "
php5-fpm --test 2> /dev/null
[ "$?" -ne 0 ] && echo "Failed" && exit 1
echo ok
