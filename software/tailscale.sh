#!/bin/sh -v
# tailscale - mesh vpn https://tailscale.com/blog/how-tailscale-works
echo "Requires root, expect sudo prompt"
curl -fsSL https://tailscale.com/install.sh | sh
sudo tailscale up
