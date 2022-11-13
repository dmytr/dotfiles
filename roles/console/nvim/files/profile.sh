export EDITOR="/usr/bin/nvim"

alias vi='nvim'
alias vim='nvim'

export LUNARVIM_RUNTIME_DIR="$HOME/.local/share/lunarvim"
export LUNARVIM_CONFIG_DIR="$HOME/.config/lvim"
export LUNARVIM_CACHE_DIR="$HOME/.cache/lvim"

export LUNARVIM_BASE_DIR="$LUNARVIM_RUNTIME_DIR/lvim"

export VIMINIT=":source $LUNARVIM_BASE_DIR/init.lua"
