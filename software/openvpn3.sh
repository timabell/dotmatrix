#!/bin/sh
set -e

# needed for saml auth
# because networkmanager can't do it https://gitlab.gnome.org/GNOME/NetworkManager-openvpn/-/issues/150

# https://community.openvpn.net/Pages/OpenVPN3Linux#stable-repository-debian-ubuntu
# modified to be idempotent

echo "Detecting distribution..."
if [ -f /etc/os-release ]; then
    . /etc/os-release
    DISTRO_ID="$ID"
    DISTRO_VERSION_CODENAME="$VERSION_CODENAME"
    
    # Map Linux Mint to Ubuntu base - https://www.linuxmint.com/download_all.php
    if [ "$DISTRO_ID" = "linuxmint" ]; then
        case "$DISTRO_VERSION_CODENAME" in
            zara|xia|wilma)                 DISTRO_VERSION_CODENAME="noble" ;;  # 22.x
            virginia|victoria|vera|vanessa) DISTRO_VERSION_CODENAME="jammy" ;;  # 21.x
        esac
        echo "Detected Linux Mint, using Ubuntu base: $DISTRO_VERSION_CODENAME"
    else
        echo "Detected: $DISTRO_ID $DISTRO_VERSION_CODENAME"
    fi
else
    echo "Error: Cannot detect distribution"
    exit 1
fi

if [ ! -f /etc/apt/keyrings/openvpn.asc ]; then
    echo "Downloading OpenVPN signing key..."
    curl -sSfL https://packages.openvpn.net/packages-repo.gpg > /etc/apt/keyrings/openvpn.asc
else
    echo "OpenVPN signing key already exists"
fi

REPO_LINE="deb [signed-by=/etc/apt/keyrings/openvpn.asc] https://packages.openvpn.net/openvpn3/debian $DISTRO_VERSION_CODENAME main"
if ! grep -q "openvpn3" /etc/apt/sources.list.d/openvpn3.list 2>/dev/null; then
    echo "Adding OpenVPN3 repository for $DISTRO_VERSION_CODENAME..."
    echo "$REPO_LINE" >> /etc/apt/sources.list.d/openvpn3.list
    apt update
else
    echo "OpenVPN3 repository already configured"
fi

echo "Installing OpenVPN3..."
apt -y install openvpn3 apt-transport-https curl

echo "OpenVPN3 installation complete"
