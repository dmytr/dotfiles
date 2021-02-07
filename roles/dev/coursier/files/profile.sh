if ! [[ ":$PATH:" =~ ":$HOME/.local/share/coursier/bin:" ]]; then
  export PATH="$PATH:$HOME/.local/share/coursier/bin"
fi
