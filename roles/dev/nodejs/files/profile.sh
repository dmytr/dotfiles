export NPM_CONFIG_USERCONFIG="$HOME/.config/npm/npmrc"

if ! [[ ":$PATH:" =~ ":$HOME/.local/npm/bin:" ]]; then
  export PATH="$PATH:$HOME/.local/npm/bin"
fi
