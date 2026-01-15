set number
set mouse=a
set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set clipboard+=unnamedplus

call plug#begin()

Plug 'bling/vim-airline' " status line
Plug 'catppuccin/nvim', { 'as': 'catppuccin' } " catppuccin themes
Plug 'scrooloose/nerdcommenter' " better commenting
Plug 'christoomey/vim-tmux-navigator' " tmux integration
Plug 'neoclide/coc.nvim', {'branch': 'release'} " code completion

call plug#end()

filetype plugin on

colo catppuccin-frappe

source ~/.config/nvim/coc_config.vim
