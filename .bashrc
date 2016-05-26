# ~/.bashrc
# vim:set ft=sh sw=2 sts=2:

source "$HOME/.sharedrc"

# Store 10,000 history entries
export HISTSIZE=10000
# Don't store duplicates
export HISTCONTROL=erasedups
# Append to history file
shopt -s histappend

VISUAL=vim
EDITOR="$VISUAL"
LESS="FRX"
RI="--format ansi -T"
PSQL_EDITOR='vim -c"setf sql"'
CLICOLOR=1
LSCOLORS=gxgxcxdxbxegedabagacad

export VISUAL EDITOR LESS RI PSQL_EDITOR CLICOLOR LSCOLORS

export HISTIGNORE="%*"

# [ -z "$PS1" ] || stty -ixon # stty not available on windows

if [ -f '/usr/local/etc/bash_completion.d/git-completion.bash' ]; then
  source '/usr/local/etc/bash_completion.d/git-completion.bash'
fi

export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/bin:$PATH"
if command -v rbenv > /dev/null 2>&1; then
	eval "$(rbenv init -)"
fi

[ ! -f "$HOME/.bashrc.local" ] || . "$HOME/.bashrc.local"


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# import aliases
[ ! -f "$HOME/.aliases" ] || . "$HOME/.aliases"

echo -ne "\033]2;bash\007"
