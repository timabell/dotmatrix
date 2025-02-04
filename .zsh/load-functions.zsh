# to be sourced in .zshrc

# autoload all functions in ~/.zsh/functions
# assumes functions are named the same as their file
for func in ~/.zsh/functions/*; do
  autoload -U ${func:t}
done
