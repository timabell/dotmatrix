#!/bin/sh -v

# https://help.ubuntu.com/community/apcupsd

sudo apt install apcupsd

APC_CONF_SOURCE="$HOME/Documents/config/apcupsd.conf"
APC_CONF="/etc/apcupsd/apcupsd.conf"
APC_CONF_BAK="${APC_CONF}.bak"

# check for .bak for idempotency
if [ ! -f "$APC_CONF_BAK" ]; then
    sudo cp "$APC_CONF" "$APC_CONF_BAK"
    sudo cp "$APC_CONF_SOURCE" "$APC_CONF"
fi
