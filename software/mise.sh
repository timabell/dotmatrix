#!/bin/sh -v
# https://mise.jdx.dev/getting-started.html

sudo apt update -y && sudo apt install -y curl
sudo install -dm 755 /etc/apt/keyrings

curl -fSs https://mise.jdx.dev/gpg-key.pub | sudo tee /etc/apt/keyrings/mise-archive-keyring.pub 1> /dev/null

echo "deb [signed-by=/etc/apt/keyrings/mise-archive-keyring.pub arch=amd64] https://mise.jdx.dev/deb stable main" | sudo tee /etc/apt/sources.list.d/mise.list

sudo apt update
sudo apt install -y mise
