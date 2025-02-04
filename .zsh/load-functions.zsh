# to be sourced in .zshrc

# autoload all functions in ~/.zsh/functions
for func in ~/.zsh/functions/*; do
  autoload -U ${func:t}
done
