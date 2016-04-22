#!/usr/bin/env bash

APP_PATH="$HOME/.dotfiles/spf13-vim" spf13-vim/bootstrap.sh

# This plugin doesn't work
rm -rf $HOME/.vim/bundle/vim-textobj-indent

# Re-link personal vimrc.local
rm -f  "$HOME/.vimrc.local"
ln -s $PWD/vimrc.local $HOME/.vimrc.local
