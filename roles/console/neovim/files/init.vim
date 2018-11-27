let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'kien/ctrlp.vim'

call plug#end()


set number
syntax on

set background=dark
let g:gruvbox_contrast_dark='soft'
colorscheme gruvbox
