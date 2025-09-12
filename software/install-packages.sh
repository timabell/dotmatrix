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

# https://superuser.com/questions/520980/how-to-force-gpg-to-use-console-mode-pinentry-to-prompt-for-passwords/1327409#1327409
# To be able to sign commits with gpg on an ssh session to a desktop ui server
sudo update-alternatives --set pinentry /usr/bin/pinentry-gtk-2
