#!/bin/bash
set -e

# https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-apt?view=azure-cli-latest

sudo apt-get update
sudo apt-get install ca-certificates curl apt-transport-https lsb-release gnupg

echo "installing gpg key..."
curl -sL https://packages.microsoft.com/keys/microsoft.asc | \
    gpg --dearmor | \
    sudo tee /etc/apt/trusted.gpg.d/microsoft.asc.gpg > /dev/null

echo "Reading disto release..."
# Get and map the codename of the OS (thanks to ChatGPT)
# mint/ubuntu mappings here https://linuxmint.com/download_all.php
if [ -f /etc/linuxmint/info ]; then
    MINT_CODENAME=$(grep 'CODENAME=' /etc/linuxmint/info | cut -d '=' -f 2)
    case $MINT_CODENAME in
        xia) AZ_DIST="noble" ;;
        wilma) AZ_DIST="noble" ;;
        virginia) AZ_DIST="jammy" ;;
        victoria) AZ_DIST="jammy" ;;
        vanessa)  AZ_DIST="jammy" ;;
        uma)      AZ_DIST="focal" ;;
        una)      AZ_DIST="focal" ;;
        ulyssa)   AZ_DIST="focal" ;;
        ulyana)   AZ_DIST="focal" ;;
        tricia)   AZ_DIST="bionic" ;;
        tina)     AZ_DIST="bionic" ;;
        tessa)    AZ_DIST="bionic" ;;
        *) echo "Unknown Mint codename: $MINT_CODENAME"; exit 1 ;;
    esac
else
    AZ_DIST=$(lsb_release -cs)
fi
echo "AZ_DIST=$AZ_REPO"

echo "Adding source..."
echo "Types: deb
URIs: https://packages.microsoft.com/repos/azure-cli/
Suites: ${AZ_DIST}
Components: main
Architectures: $(dpkg --print-architecture)
Signed-by: /etc/apt/keyrings/microsoft.gpg" | sudo tee /etc/apt/sources.list.d/azure-cli.sources

echo "Updating..."
sudo apt-get update
echo "Installing..."
sudo apt-get install azure-cli

echo "Installed. Version:"
az --version
