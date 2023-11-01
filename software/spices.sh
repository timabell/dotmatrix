#!/bin/sh -v

echo "Once this has run, open the applets/extensions/desklets applications and enable the desired items."

cd ~/.local/share/cinnamon

(
	cd extensions

	# gTile - https://cinnamon-spices.linuxmint.com/extensions/view/76
	wget https://cinnamon-spices.linuxmint.com/files/extensions/gTile@shuairan.zip
	unzip gTile@shuairan.zip
	rm gTile@shuairan.zip
)
