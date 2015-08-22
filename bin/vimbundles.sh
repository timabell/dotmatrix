#!/usr/bin/env bash

# use call with -l to list github address of all bundles
# use with -l -v to see the head of all readmes

source $(dirname $0)/dot_functions.sh

directory_warning


LIST_ONLY=false
VERBOSE=false

OPTIND=1
while getopts "lv" opt; do
  case "$opt" in
    l)
      LIST_ONLY=true
      ;;
    v)
      VERBOSE=true
      ;;
  esac
done

if [ ! -d "$HOME/.vimbundles" ]; then
  BASE="$HOME/.vim/bundle"
else
  BASE="$HOME/.vimbundles"
fi

# setup pathogen
mkdir -p "$HOME/vimfiles/autoload"
ln -nf .vim/autoload/pathogen.vim "$HOME/vimfiles/autoload/"
ln -nf .vim/shell-wrapper.sh "$HOME/.vim/"

if [ "$1" = "log-since" ]; then
  echo "**logsince**"
  logsince="true"
  date="$2"
else
  logsince="false"
fi

if $($logsince) ; then
  echo "*** logsince ***"
fi

mkdir -p $BASE

action_from() {
  if [ -r $1 ]; then
    repos="$(cat $1)"
    for repo in $repos; do
      cd $BASE
      dir="$(basename $repo)"
      if $LIST_ONLY; then
        echo "https://github.com/$repo"
        if $VERBOSE; then
          find "$dir" -maxdepth 1 -iname "README*" | xargs head
          echo "============================================================="
          echo "============================================================="
        fi
      else
        if [ -d "$BASE/$dir" ]; then
          cd "$BASE/$dir"
        if $logsince ; then
          echo "Log for repo $repo" >>/tmp/vimbundles.log
          git log --since $date --color=always >>/tmp/vimbundles.log
        else
          echo "Updating $repo"
          git pull --rebase
        fi
        else
          git clone https://github.com/"$repo".git
        fi
      fi
    done
  fi
}

action_from "$HOME/.vimbundle"
action_from "$HOME/.vimbundle.local"

if $logsince ; then
  less "/tmp/vimbundles.log"
  rm "/tmp/vimbundles.log"
fi
