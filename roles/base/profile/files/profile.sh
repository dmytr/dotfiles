if [ -d "$HOME/.config/profile.d" ]; then
  for conf in $HOME/.config/profile.d/*.sh; do
    . $conf
  done
fi
