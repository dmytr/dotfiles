if ! [[ ":$PATH:" =~ ":$HOME/.local/bin:" ]]; then
  export PATH="$PATH:$HOME/.local/bin"
fi
