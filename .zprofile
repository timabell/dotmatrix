# If this shell is reached via SSH/Mosh, use a separate agent (no desktop GUI prompts)
if [ -n "$SSH_CONNECTION" ] || [ -n "$SSH_CLIENT" ] || [ -n "$MOSH_CONNECTION" ]; then
  export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent-remote.sock"

  # run a new ssh-agent in the background if socket not already available
  if [ ! -S "$SSH_AUTH_SOCK" ]; then
    eval "$(ssh-agent -a "$SSH_AUTH_SOCK" -s)" >/dev/null
  fi
fi
