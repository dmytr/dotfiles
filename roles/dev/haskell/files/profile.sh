if ! [[ ":$PATH:" =~ ":$HOME/.ghcup/bin:" ]]; then
  export PATH="$PATH:$HOME/.ghcup/bin"
fi
