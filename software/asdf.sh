#!/bin/sh -v

# https://asdf-vm.com/guide/getting-started.html#_2-download-asdf

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.1

asdf plugin add dotnet-core
asdf plugin add golang
asdf plugin add nodejs
asdf plugin add python
asdf plugin add ruby
asdf plugin add rust
