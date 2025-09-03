#!/bin/sh -v
cd ~

# create preferred symlinks, skipping any that already exist

[ ! -e dm ] && ln -s ~/repo/dotmatrix dm
[ ! -e bin ] && ln -s ~/Documents/programs/bin
[ ! -e scripts ] && ln -s ~/repo/scripts
[ ! -e notes ] && ln -s ~/oneplus9-home/Documents/looksyk/pages notes
[ ! -e logseq ] && ln -s ~/oneplus9-home/Documents/logseq
[ ! -e blog ] && ln -s ~/repo/0x5.uk blog

# seem to end up with a default local file, if it's there move it before creating the link
if [ ! -L ~/.gitconfig.local ]; then
    [ -f ~/.gitconfig.local ] && mv ~/.gitconfig.local ~/.gitconfig.local.bak
    ln -s ~/Documents/config/.gitconfig.local
fi
