#!/bin/sh -v
echo Expect a sudo prompt for apt

# http://www.webupd8.org/2014/09/syncthing-gui-gtk3-python-gui-ubuntu-ppa.html
sudo add-apt-repository -y ppa:nilarimogard/webupd8
sudo apt update

# echo removing firefox
# sudo apt-get remove firefox

echo removing unwanted packages
sudo apt remove keepassx

if [ "$1" = "single" ]; then
  for x in `cat packages.txt`; do
    echo "installing packages $x"
    sudo apt install $x
  done
else
  echo "installing packages:"
  cat packages.txt
  sudo apt install `cat packages.txt`
fi

