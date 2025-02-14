#!/bin/bash

# Locate the profiles.ini file
PROFILES_INI="$HOME/.mozilla/firefox/profiles.ini"

# Extract the default profile path using grep and sed
DEFAULT_PROFILE=$(grep -E '^\[Profile[0-9]+\]' -A4 "$PROFILES_INI" | grep -B3 'Default=1' | grep '^Path=' | cut -d'=' -f2)

# Print the result
if [[ -n "$DEFAULT_PROFILE" ]]; then
    echo "$DEFAULT_PROFILE"
else
	echo "No default Firefox profile found."
	exit 1
fi

