#!/bin/bash

echo --- Tests ---

echo -n "Checking if apache is installed correctly... "
apachectl configtest > /dev/null 2> /dev/null
[ "$?" -ne 0 ] && echo "Failed" && exit 1
echo ok
