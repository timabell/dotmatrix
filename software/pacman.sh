#!/bin/sh -v
# https://dev.to/shrihankp/make-your-terminal-look-swag-with-msys2-and-zsh-32b7
pacman -S man vim openssh

curl -L https://raw.githubusercontent.com/git-for-windows/build-extra/HEAD/git-for-windows-keyring/git-for-windows.gpg |
pacman-key --add - &&
pacman-key --lsign-key 91883E11E83DC29D14104DB4EDD44359093056EE

pacman -Syyuu
pacman -Syuu

pacman -S git git-extras
pacman -S mingw-w64-x86_64-git-credential-manager
# pacman -S mingw-w64-x86_64-git-lfs # not needed
# pacman -S mingw-w64-x86_64-git-doc-man mingw-w64-x86_64-git-doc-html # failed

pacman -S zsh
pacman -S mingw-w64-x86_64-fzf
pacman -S mingw-w64-x86_64-delta
pacman -S msys/tig

# search - https://www.msys2.org/docs/package-management/#finding-a-package
# pacman -Ss [name]
