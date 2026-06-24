" numbers
set number
set relativenumber

" auto indent settings
set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab

" set clipboard to system
set clipboard+=unnamedplus

" remove annoying swap files
set noswapfile

" remove splash screen
set shm+=I

" keep cursor 5 from top/bottom
set scrolloff=5

" take a wild fucking guess on what this is
call plug#begin()

Plug 'bling/vim-airline' " status line
Plug 'catppuccin/nvim', { 'as': 'catppuccin' } " catppuccin themes
Plug 'scrooloose/nerdcommenter' " better commenting
Plug 'christoomey/vim-tmux-navigator' " tmux integration
Plug 'neoclide/coc.nvim', {'branch': 'release'} " code completion
Plug 'kannokanno/previm' " markdown live preview

call plug#end()

" plugins for specific filetypes (probably for .md viewer)
filetype plugin on

" remove highlighting by pressing escape in normal mode
nmap <Esc> <cmd>nohlsearch<CR>

" color scheme obviously
colo catppuccin-frappe

" config coc
source ~/.config/nvim/coc_config.vim
