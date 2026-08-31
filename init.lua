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

-- set leader
vim.g.mapleader = " "

-- take a wild fucking guess on what this is
local Plug = vim.fn['plug#']
vim.call('plug#begin')

Plug('bling/vim-airline') -- status line
Plug('ryanoasis/vim-devicons') -- icon fix?
Plug('catppuccin/nvim', { as = 'catppuccin' }) -- catppuccin themes
Plug('scrooloose/nerdcommenter') -- better commenting
Plug('christoomey/vim-tmux-navigator') -- tmux integration
Plug('neoclide/coc.nvim', { branch = 'release' }) -- code completion
Plug('norcalli/nvim-colorizer.lua')

vim.call('plug#end')

-- for some reason the default line number symbol doesn't exist(? idk it just appears as a box)
vim.cmd([[
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

  let g:airline_symbols.linenr = '☰'
]])

-- plugins for specific filetypes
vim.cmd('filetype plugin on')

-- remove highlighting by pressing escape in normal mode
vim.keymap.set('n', '<esc>', '<cmd> nohlsearch<cr>')

-- escape for terminal
vim.keymap.set('t', '<esc>', '<C-\\><C-n>')

-- align command
function CustomAlign()
  local char = vim.fn.getchar()
  if char ~= "" then
    vim.cmd('normal 0"ty^')

    vim.cmd('silent! \'<,\'>s/ \\{2,}/ /ge')
    vim.cmd('\'<,\'>!column -t -s"' .. string.char(char) .. '" -o"' .. string.char(char) .. '"')

    if vim.fn.getline('.'):sub(1,1) == " " then
      vim.cmd('\'<,\'>normal 0x"tP')
    end
  end
end

vim.keymap.set('v', '<leader>a', CustomAlign)

-- surround command
function CustomSurround()
  local SurroundString = ''

  while true do
    local char = vim.fn.getchar()
    if char == 27 then
      return
    end

    if char == 13 then
      break
    end

    SurroundString = SurroundString..string.char(char)
  end

  local SurroundStringEnd = string.gsub(SurroundString, '.', { ['<']='>', ['(']=')', ['[']=']', ['{'] = '}' })
  local NewString = SurroundString..vim.fn.getregion(vim.fn.getpos('.'), vim.fn.getpos('v'))[1]..SurroundStringEnd
  local StartPos = vim.fn.getpos('v')
  local EndPos = vim.fn.getpos('.')
  vim.api.nvim_buf_set_text(0, StartPos[2]-1, StartPos[3]-1, EndPos[2]-1, EndPos[3], {NewString})
  --vim.cmd('normal A gv"txi'..SurroundString..'t'..SurroundStringEnd..'$xgv')
end

vim.keymap.set('v', '<leader>s', CustomSurround)

-- manpage bind
vim.keymap.set('n', '<leader>m', ':tab Man ') -- space is intentional

vim.api.nvim_create_autocmd({'BufRead','BufNewFile'}, {
  pattern = {'*.i3config'},
  command = "set filetype=i3config"
})

-- color scheme obviously
vim.cmd('colorscheme catppuccin-frappe')

-- config coc
vim.cmd("source ~/.config/nvim/coc_config.vim")
