#!/bin/sh -v
set -e

# needed for saml auth
# because networkmanager can't do it https://gitlab.gnome.org/GNOME/NetworkManager-openvpn/-/issues/150

# https://community.openvpn.net/Pages/OpenVPN3Linux#stable-repository-debian-ubuntu

apt install apt-transport-https curl

# Retrieve the OpenVPN Inc package signing key:

# mkdir -p /etc/apt/keyrings    ### This might not exist in all distributions
curl -sSfL https://packages.openvpn.net/packages-repo.gpg >/etc/apt/keyrings/openvpn.asc

# Replace the DISTRIBUTION part in the command below using the release name from the table above to set up the apt source listing:
# echo "deb [signed-by=/etc/apt/keyrings/openvpn.asc] https://packages.openvpn.net/openvpn3/debian DISTRIBUTION main" >>/etc/apt/sources.list.d/openvpn3.list

# Example for Debian 12:

echo "deb [signed-by=/etc/apt/keyrings/openvpn.asc] https://packages.openvpn.net/openvpn3/debian noble main" >> /etc/apt/sources.list.d/openvpn3.list

# To install OpenVPN 3 Linux, run these commands:

apt update
apt install openvpn3
