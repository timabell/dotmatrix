#!/bin/sh -v
# run this with:
# curl https://raw.githubusercontent.com/timabell/dotmatrix/master/bin/bootstrap.sh | sh
wget https://raw.githubusercontent.com/timabell/dotmatrix/master/bin/packages.txt
wget https://raw.githubusercontent.com/timabell/dotmatrix/master/bin/packages.sh
chmod +x packages.sh
./packages.sh
