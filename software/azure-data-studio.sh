#!/bin/bash -v
# https://learn.microsoft.com/en-us/azure-data-studio/download-azure-data-studio?view=sql-server-ver16&tabs=win-install,win-user-install,redhat-install,windows-uninstall,redhat-uninstall#download-azure-data-studio
set -e
mkdir --parents /tmp/data-studio
cd /tmp/data-studio
wget https://download.microsoft.com/download/4/d/b/4dbf3bbc-418c-42db-ae0d-a52135b7d991/azuredatastudio-linux-1.50.0.deb
ls -alh
sudo dpkg -i azuredatastudio-linux-1.50.0.deb
