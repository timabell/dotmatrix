#!/bin/sh -v

# https://asdf-vm.com/guide/getting-started.html#_2-download-asdf

# binary should already be in ~/bin (manual, but sync'd from docs/progs/bin)
# git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.18.0

asdf plugin add dotnet-core
asdf plugin add golang
asdf plugin add nodejs
asdf plugin add python
asdf plugin add ruby
asdf plugin add rust
asdf plugin add adr-tools
asdf plugin add just # https://github.com/olofvndrhr/asdf-just

asdf install
