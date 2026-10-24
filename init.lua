-- numbers
vim.o.number = true
vim.o.relativenumber = true

-- indent settings
vim.o.autoindent = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.smarttab = true
vim.o.expandtab = true

-- set clipboard to system
vim.o.clipboard = 'unnamedplus'

-- remove annoying swap files
vim.o.swapfile = false

-- remove splash screen
vim.o.shm = vim.o.shm .. "I"

-- keep cursor 10 from top/bottom
vim.o.scrolloff = 10

vim.o.mouse = "a"

-- set leader
vim.g.mapleader = " "

vim.g.rust_recommended_style = 0

-- take a wild fucking guess on what this is
local Plug = vim.fn['plug#']
vim.call('plug#begin')

Plug('bling/vim-airline') -- status line
Plug('catppuccin/nvim', { as = 'catppuccin' }) -- catppuccin themes
Plug('scrooloose/nerdcommenter') -- better commenting
Plug('christoomey/vim-tmux-navigator') -- tmux integration
Plug('neoclide/coc.nvim', { branch = 'release' }) -- code completion
Plug('norcalli/nvim-colorizer.lua') -- puts color on hex codes
Plug('mg979/vim-visual-multi', {branch = 'master'}) -- multi-cursor

vim.call('plug#end')

-- color scheme obviously
vim.cmd('colorscheme catppuccin-frappe')

-- for some reason the default line number symbol doesn't exist(? idk it just appears as a box)
vim.g.airline_symbols = {
  ["linenr"] = '☰'
}

-- plugins for specific filetypes
vim.cmd('filetype plugin on')

vim.g.VM_maps = {
  ["Add Cursor Down"] = '<M-j>',
  ["Add Cursor Up"] = '<M-k>'
}

-- remove highlighting by pressing escape in normal mode
vim.keymap.set('n', '<esc>', '<cmd> nohlsearch<cr>')

-- escape for terminal
vim.keymap.set('t', '<esc>', '<C-\\><C-n>')

-- manpage bind
vim.keymap.set('n', '<leader>m', ':tab Man ') -- space is intentional

-- config coc
vim.cmd("source ~/.config/nvim/coc_config.vim")
