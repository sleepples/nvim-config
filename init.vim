" numbers
set number
set relativenumber

" indent settings
set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set expandtab

" set clipboard to system
set clipboard+=unnamedplus

" remove annoying swap files
set noswapfile

" remove splash screen
set shm+=I

" keep cursor 5 from top/bottom
set scrolloff=10

" set leader
map <space> <leader>

" take a wild fucking guess on what this is
call plug#begin()

Plug 'bling/vim-airline' " status line
Plug 'ryanoasis/vim-devicons' " icon fix?
Plug 'catppuccin/nvim', { 'as': 'catppuccin' } " catppuccin themes
Plug 'scrooloose/nerdcommenter' " better commenting
Plug 'christoomey/vim-tmux-navigator' " tmux integration
Plug 'neoclide/coc.nvim', {'branch': 'release'} " code completion

call plug#end()

" create airline_symbols map so i can change the line number symbol
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" for some reason the default line number symbol doesn't exist(? idk it just appears as a box)
let g:airline_symbols.linenr = '☰'

" plugins for specific filetypes
filetype plugin on

" remove highlighting by pressing escape in normal mode
nmap <esc> <cmd> nohlsearch<cr>

" escape for terminal
tnoremap <Esc> <C-\><C-n>

" align command
func CustomAlign(char)
  if a:char != ""
    normal 0"ty^

    silent! '<,'>s/ \{2,}/ /ge
    execute "'<,'>!column -t -s\"" .. a:char .. "\" -o\"" .. a:char .. "\""

    if getline('.')[0] == " "
      '<,'>normal 0x"tP
    endif
  endif
endfunc

vmap <leader>a :<C-U>call CustomAlign(printf("%c", getchar()))<cr>

" surround command
func CustomSurround()
  let SurroundString = ""

  while v:true
    let Char = getcharstr()
    if Char == ""
      return
    endif
    if Char == ""
      break
    endif
    let SurroundString = SurroundString .. Char
  endwhile
  
  execute "normal gv\"txa".SurroundString."t".SurroundString
endfunc

vmap <leader>s :<C-U>call CustomSurround()<cr>

" manpage bind
nmap <leader>m :tab Man |" space is intentional

" color scheme obviously
colo catppuccin-frappe

" config coc
source ~/.config/nvim/coc_config.vim
