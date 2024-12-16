#!/bin/sh -v
# run this with:
# curl https://raw.githubusercontent.com/timabell/dotmatrix/main/software/bootstrap.sh | sh
cd /tmp
wget -N https://raw.githubusercontent.com/timabell/dotmatrix/main/software/packages.txt
wget -N https://raw.githubusercontent.com/timabell/dotmatrix/main/software/install-packages.sh
chmod +x install-packages.sh
./install-packages.sh
