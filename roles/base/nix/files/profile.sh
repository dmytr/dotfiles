if [ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ]; then
  OLD_PATH="$PATH"

  . "$HOME/.nix-profile/etc/profile.d/nix.sh"

  if ! [[ ":$OLD_PATH:" =~ ":$HOME/.nix-profile/bin:" ]]; then
    export PATH="$OLD_PATH:$HOME/.nix-profile/bin"
  else
    export PATH="$OLD_PATH"
  fi
fi
