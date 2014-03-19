#!/bin/bash

# vim doesn't clear previous commands so clear previous output now:
clear

# strip the -c that vim adds to bash from arguments to this script
shift

# make it look like shell prompt with the command entered:
echo \$ $@

# run the command:
eval $@
