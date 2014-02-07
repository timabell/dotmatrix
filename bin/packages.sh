#!/bin/sh
sudo apt-get update
echo removing firefox
echo expect a sudo prompt
sudo apt-get remove firefox
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
