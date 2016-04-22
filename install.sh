#!/bin/bash -e

#
# Setup helpers
#

do_init() {
    git submodule init
    git submodule update
}

do_backup() {
    local backup_dir=$(pwd)/backup_`date +%Y%m%d_%H%M%S`

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
    if [ -e ~/.gitconfig ]
        then cp -L ~/.gitconfig $backup_dir
    fi

    if [ -e ~/.emacs.d ]
        then cp -L -r ~/.emacs.d $backup_dir
    fi
}

do_symlink() {
    ln -sf $(pwd)/zshenv ~/.zshenv
    ln -sf $(pwd)/zshrc ~/.zshrc
    ln -sf $(pwd)/vimrc.local ~/.vimrc.local
    ln -sf $(pwd)/gitconfig ~/.gitconfig

    ln -sfn $(pwd)/spacemacs ~/.emacs.d
}

#
# Install all the things
#

do_init
do_backup
do_symlink

source install-spf13-vim.sh

