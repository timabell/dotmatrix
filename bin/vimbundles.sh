#!/usr/bin/env bash

# use call with -l to list github address of all bundles

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


mkdir -p ~/.vimbundles
cd ~/.vimbundles

get_bundle() {
  if $LIST_ONLY; then
    echo "https://github.com/$1/$2"
    if $VERBOSE; then
      find "$2" -maxdepth 1 -iname "README*" | xargs head
      echo "============================================================="
      echo "============================================================="
    fi
    return
  fi
  (
  if [ -d "$2" ]; then
    echo "Updating $1's $2"
    cd "$2"
    git pull --rebase
  else
    git clone "git://github.com/$1/$2.git"
  fi
  )
}

get_bundle AndrewRadev splitjoin.vim
get_bundle duff vim-bufonly
get_bundle ervandew supertab
get_bundle godlygeek tabular
get_bundle kchmck vim-coffee-script
get_bundle leshill vim-json
get_bundle mileszs ack.vim
get_bundle pangloss vim-javascript
get_bundle tpope vim-abolish
get_bundle tpope vim-bundler
get_bundle tpope vim-commentary
get_bundle tpope vim-cucumber
get_bundle tpope vim-endwise
get_bundle tpope vim-eunuch
get_bundle tpope vim-fugitive
get_bundle tpope vim-git
get_bundle tpope vim-haml
get_bundle tpope vim-markdown
get_bundle tpope vim-pathogen
get_bundle tpope vim-rake
get_bundle tpope vim-ragtag
get_bundle tpope vim-rails
get_bundle tpope vim-repeat
get_bundle tpope vim-rsi
get_bundle tpope vim-sensible
get_bundle tpope vim-sleuth
get_bundle tpope vim-speeddating
get_bundle tpope vim-surround
get_bundle tpope vim-unimpaired
get_bundle vim-ruby vim-ruby
get_bundle vim-scripts bufkill.vim
get_bundle vim-scripts bufexplorer.zip
get_bundle jgdavey vim-blockle
get_bundle jgdavey tslime.vim
get_bundle jgdavey vim-turbux
get_bundle jgdavey vim-weefactor
get_bundle gregsexton gitv
get_bundle rondale-sc vim-spacejam
get_bundle elixir-lang vim-elixir
get_bundle kien ctrlp.vim
get_bundle kurkale6ka vim-swap

if ! $LIST_ONLY ; then
  echo Running helptags...
  vim -c 'call pathogen#helptags()|q'
fi
