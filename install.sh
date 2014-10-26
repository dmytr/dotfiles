#!/bin/bash -e

#
# Fetch dependencies
#

git submodule init
git submodule update

#
# First backup everything
#

backup_dir=$(pwd)/backup_`date +%Y%m%d_%H%M%S`

mkdir -p $backup_dir

cp -L ~/.zshenv $backup_dir
cp -L ~/.zshrc $backup_dir
cp -L ~/.vimrc.local $backup_dir
cp -L ~/.gitconfig $backup_dir
cp -L ~/.tmux.conf $backup_dir

cp -L -r ~/.emacs.d $backup_dir

#
# Setup dotfiles
#

ln -sf $(pwd)/zshenv ~/.zshenv
ln -sf $(pwd)/zshrc ~/.zshrc
ln -sf $(pwd)/vimrc.local ~/.vimrc.local
ln -sf $(pwd)/gitconfig ~/.gitconfig
ln -sf $(pwd)/tmux.conf ~/.tmux.conf

ln -sf $(pwd)/emacs-prelude ~/.emacs.d

#
# Install haskell-vim-now
#

source haskell-vim-now/install.sh
