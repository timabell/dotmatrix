#!/usr/bin/env bash
cd ~
mkdir -p .dotmatrix/
cd .dotmatrix/

get_bundle() {
  (
  if [ -d "$2.git" ]; then
    echo "Updating $1's $2"
    cd "$2.git"
    git pull --rebase
  else
    echo "Cloning $1's $2 into `pwd`"
    git clone "git@github.com:$1/$2.git" "$2.git"
  fi
  )
}

get_bundle sigurdga gnome-terminal-colors-solarized

cd gnome-terminal-colors-solarized.git
echo Installing...
./install.sh
