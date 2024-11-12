#!/bin/sh -v
set -e
# https://github.com/Azure/azure-functions-core-tools?tab=readme-ov-file#linux

wget -q https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get update
sudo apt-get install azure-functions-core-tools-4
