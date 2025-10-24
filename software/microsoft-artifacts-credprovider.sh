#!/bin/sh -v
# https://github.com/microsoft/artifacts-credprovider
# For magic nuget feed auth
# https://github.com/microsoft/artifacts-credprovider/blob/master/helpers/installcredprovider.sh
# wget -qO- https://aka.ms/install-artifacts-credprovider.sh | bash
wget -qO- https://github.com/microsoft/artifacts-credprovider/releases/latest/download/installcredprovider.sh | bash
ls -al ~/.nuget/plugins/netcore
