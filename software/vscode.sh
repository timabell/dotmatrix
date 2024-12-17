#!/bin/sh
echo "Download and install the deb from vscode site"
xdg-open https://code.visualstudio.com/
# the flatpak is unofficial and requires configuring to escape the flatpak sandbox.
# there is no scriptable apt install
# there's a snap https://snapcraft.io/code ...
# ... but snap is forbidden: https://linuxmint-user-guide.readthedocs.io/en/latest/snap.html
# lame
