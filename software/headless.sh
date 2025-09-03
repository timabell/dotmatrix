#!/bin/sh -v

# https://www.digitalocean.com/community/tutorials/how-to-set-up-a-remote-desktop-with-x2go-on-ubuntu-20-04
# https://help.ubuntu.com/community/apcupsd

sudo apt install mint-meta-mate x2goserver x2goserver-xsession apcupsd

APC_CONF_SOURCE="$HOME/Documents/config/apcupsd.conf"
APC_CONF="/etc/apcupsd/apcupsd.conf"
APC_CONF_BAK="${APC_CONF}.bak"

# check for .bak for idempotency
if [ ! -f "$APC_CONF_BAK" ]; then
    sudo cp "$APC_CONF" "$APC_CONF_BAK"
    sudo cp "$APC_CONF_SOURCE" "$APC_CONF"
fi
