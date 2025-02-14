#!/bin/bash
set -e
profile=`./active-firefox-profile.sh`
chrome_path="$HOME/.mozilla/firefox/$profile/chrome"
echo "Editing default profile at $chrome_path"
mkdir -p "$chrome_path"
echo '#TabsToolbar { visibility: collapse !important; }' >> "$chrome_path/userChrome.css"
echo "CSS added. Now go to about:config and set toolkit.legacyUserProfileCustomizations.stylesheets to true"
