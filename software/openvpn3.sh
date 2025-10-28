#!/bin/sh
set -e

# needed for saml auth
# because networkmanager can't do it https://gitlab.gnome.org/GNOME/NetworkManager-openvpn/-/issues/150

# https://community.openvpn.net/Pages/OpenVPN3Linux#stable-repository-debian-ubuntu
# modified to be idempotent

if [ "$(id -u)" -ne 0 ]; then
    echo "Error: This script must be run as root"
    exit 1
fi

echo "Installing prerequisites..."
apt install apt-transport-https curl

if [ ! -f /etc/apt/keyrings/openvpn.asc ]; then
    echo "Downloading OpenVPN signing key..."
    curl -sSfL https://packages.openvpn.net/packages-repo.gpg > /etc/apt/keyrings/openvpn.asc
else
    echo "OpenVPN signing key already exists"
fi

if ! grep -q "openvpn3" /etc/apt/sources.list.d/openvpn3.list 2>/dev/null; then
    echo "Adding OpenVPN3 repository..."
    echo "deb [signed-by=/etc/apt/keyrings/openvpn.asc] https://packages.openvpn.net/openvpn3/debian noble main" >> /etc/apt/sources.list.d/openvpn3.list
    apt update
else
    echo "OpenVPN3 repository already configured"
fi

echo "Installing OpenVPN3..."
apt install openvpn3

echo "OpenVPN3 installation complete"
