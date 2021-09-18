#!/bin/sh -v
# run this with:
# curl https://raw.githubusercontent.com/timabell/dotmatrix/master/software/bootstrap.sh | sh
cd /tmp
wget -N https://raw.githubusercontent.com/timabell/dotmatrix/master/software/packages.txt
wget -N https://raw.githubusercontent.com/timabell/dotmatrix/master/software/install-packages.sh
chmod +x install-packages.sh
./install-packages.sh
