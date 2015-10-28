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

if [ -e ~/.zshenv ]
  then cp -L ~/.zshenv $backup_dir
fi
if [ -e ~/.zshrc ]
  then cp -L ~/.zshrc $backup_dir
fi
if [ -e ~/.vimrc.local ]
  then cp -L ~/.vimrc.local $backup_dir
fi
if [ -e ~/.vim.local ]
  then cp -L -r ~/.vim.local $backup_dir
fi
if [ -e ~/.gitconfig ]
  then cp -L ~/.gitconfig $backup_dir
fi
if [ -e ~/.tmux.conf ]
  then cp -L ~/.tmux.conf $backup_dir
fi

if [ -e ~/.emacs.d ]
  then cp -L -r ~/.emacs.d $backup_dir
fi

#
# Setup dotfiles
#

ln -sf $(pwd)/zshenv ~/.zshenv
ln -sf $(pwd)/zshrc ~/.zshrc
ln -sf $(pwd)/vimrc.local ~/.vimrc.local
ln -sf $(pwd)/vim.local ~/.vim.local
ln -sf $(pwd)/gitconfig ~/.gitconfig
ln -sf $(pwd)/tmux.conf ~/.tmux.conf

ln -sf $(pwd)/emacs-prelude ~/.emacs.d

#
# Install haskell-vim-now
#

source haskell-vim-now/install.sh
