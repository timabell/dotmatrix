#!/bin/sh -v

# https://dev.to/shrihankp/make-your-terminal-look-swag-with-msys2-and-zsh-32b7

# search:
#   pacman -Ss [name]
#   https://www.msys2.org/docs/package-management/#finding-a-package

### git-for-windows setup because: https://github.com/msys2/MSYS2-packages/issues/3358
# https://github.com/git-for-windows/git/wiki/Install-inside-MSYS2-proper

sed -i '/^\[mingw32\]/{ s|^|[git-for-windows]\nServer = https://wingit.blob.core.windows.net/x86-64\n\n[git-for-windows-mingw32]\nServer = https://wingit.blob.core.windows.net/i686\n\n|; }' /etc/pacman.conf

rm -r /etc/pacman.d/gnupg/
pacman-key --init
pacman-key --populate msys2

curl -L https://raw.githubusercontent.com/git-for-windows/build-extra/HEAD/git-for-windows-keyring/git-for-windows.gpg |
pacman-key --add - &&
pacman-key --lsign-key E8325679DFFF09668AD8D7B67115A57376871B1C &&
pacman-key --lsign-key 3B6D86A1BA7701CD0F23AED888138B9E1A9F3986

pacman -Syyuu

########## expect shell restart ##########

pacman -Suu

### end of git-for-windows setup

pacman -S man nvim openssh zsh mingw-w64-x86_64-fzf mingw-w64-x86_64-delta msys/tig

