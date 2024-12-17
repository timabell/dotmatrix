#!/bin/sh -v
echo "Expect a sudo prompt for apt"

echo removing unwanted packages
sudo apt remove keepassx

packages=`grep -v '^#' packages.txt` # filter out commented lines
if [ "$1" = "single" ]; then
  for x in $packages; do
    echo "installing packages $x"
    sudo apt install -y $x
  done
else
  echo "installing packages:"
  echo $packages
  sudo apt install -y $packages
fi

