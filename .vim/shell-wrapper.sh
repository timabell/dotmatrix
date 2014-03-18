#!/bin/bash

# vim doesn't clear previous commands so clear previous output now:
clear

# import aliases
shopt -s expand_aliases
[ ! -f "$HOME/.bash_aliases" ] || . "$HOME/.bash_aliases"

# strip the -c that vim adds to bash from arguments to this script
shift

# make it look like shell prompt with the command entered:
echo \$ $@

# run the command:
eval $@
