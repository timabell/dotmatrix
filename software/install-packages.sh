#!/bin/sh -v
echo "Expect a sudo prompt for apt"

sudo add-apt-repository -y ppa:nilarimogard/webupd8 # http://www.webupd8.org/2014/09/syncthing-gui-gtk3-python-gui-ubuntu-ppa.html
sudo add-apt-repository -y ppa:shutter/ppa # https://www.linuxuprising.com/2021/08/official-shutter-screenshot-tool.html
sudo apt update # this is no longer needed on Ubuntu but its required on Linux Mint

echo removing unwanted packages
sudo apt remove keepassx

if [ "$1" = "single" ]; then
  for x in `cat packages.txt`; do
    echo "installing packages $x"
    sudo apt install -y $x
  done
else
  echo "installing packages:"
  cat packages.txt
  sudo apt install -y `cat packages.txt`
fi

