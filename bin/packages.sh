#!/bin/sh -v
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install `cat packages.txt`
