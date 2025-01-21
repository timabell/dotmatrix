#!/bin/bash
set -e
# https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-apt?view=azure-cli-latest
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

echo ""
echo "Install complete"
echo ""

az --version
