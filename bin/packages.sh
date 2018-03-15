#!/bin/sh
echo Expect a sudo prompt for apt-get use...
sudo apt-get update
# echo removing firefox
# sudo apt-get remove firefox
if [ "$1" = "single" ]; then
  for x in `cat packages.txt`; do
    echo "installing packages $x"
    sudo apt-get install $x
  done
else
  echo "installing packages:"
  cat packages.txt
  sudo apt-get install `cat packages.txt`
fi
echo removing unwanted packages
sudo apt remove keepassx
