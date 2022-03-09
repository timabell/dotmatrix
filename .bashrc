# ~/.bashrc
# vim:set ft=sh sw=2 sts=2:

source "$HOME/.sharedrc"

# Store 10,000 history entries
export HISTSIZE=10000
# Don't store duplicates
export HISTCONTROL=erasedups:ignorespace
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

if [ -t 1 ]; then
bind 'set bind-tty-special-chars off'
bind '"\ep": history-search-backward'
bind '"\en": history-search-forward'
bind '"\C-w": backward-kill-word'
bind '"\C-q": "%-\n"'
fi

export HISTIGNORE="%*"

# windows bash not happy with prompt. removed

if [ -f '/usr/local/etc/bash_completion.d/git-completion.bash' ]; then
  source '/usr/local/etc/bash_completion.d/git-completion.bash'
fi

export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/bin/dotnet:$PATH"
if command -v rbenv > /dev/null 2>&1; then
	eval "$(rbenv init -)"
fi

[ ! -f "$HOME/.bashrc.local" ] || . "$HOME/.bashrc.local"


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# import aliases
[ ! -f "$HOME/.aliases" ] || . "$HOME/.aliases"

# Allow alias expansion in non-interactive shells, notably running stuff from within vim
# http://stackoverflow.com/a/18901595/10245
shopt -s expand_aliases

# added by travis gem
[ -f /home/tim/.travis/travis.sh ] && source /home/tim/.travis/travis.sh

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export GIT_SSH=C:/Windows/System32/OpenSSH/ssh.exe # use windows build in ssh that has an agent in windows services, don't forget to ssh-add your key - https://stackoverflow.com/questions/370030/why-git-cant-remember-my-passphrase-under-windows/58784438#58784438
