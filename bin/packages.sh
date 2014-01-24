#!/bin/sh
echo removing firefox
echo expect a sudo prompt
sudo apt-get remove firefox
echo "installing packages:"
cat packages.txt
sudo apt-get install `cat packages.txt`
