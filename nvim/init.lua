-------------------------------------------------------------
---  _       _ _     _             
--- (_)_ __ (_) |_  | |_   _  __ _ 
--- | | '_ \| | __| | | | | |/ _` |
--- | | | | | | |_ _| | |_| | (_| |
--- |_|_| |_|_|\__(_)_|\__,_|\__,_|
-------------------------------------------------------------

--- Useful for debugging
--- vim.lsp.set_log_level('trace')
vim.g.mapleader = " "

require 'plugins'
require 'conf'

vim.cmd 'colorscheme gruvbox'
--- Breaks diagnostic
--- vim.cmd 'syntax on'


vim.opt.background = 'dark'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.smartcase = true
vim.opt.confirm = true
vim.opt.mouse = 'a'
vim.opt.cmdheight = 2
vim.opt.timeout = false
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 200
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undodir = os.getenv('HOME') .. '/.cache/nvim/undodir'
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.colorcolumn = '80'
vim.opt.signcolumn = 'number'
vim.opt.termguicolors = true
vim.opt.completeopt = 'menuone,noinsert,noselect'
vim.opt.inccommand = 'split'

-------------------------------------------------------------
--- Mappings
-------------------------------------------------------------
mapk = vim.api.nvim_set_keymap
local opts = { noremap = true }

--- Move around visually selected lines
mapk('v', 'J', ':m \'>+1<CR>gv=gv', opts)
mapk('v', 'K', ':m \'<-2<CR>gv=gv', opts)

--- Move in quickfix list
mapk('n', '<C-j>', ':cnext<CR>', opts)
mapk('n', '<C-k>', ':cprevious<CR>', opts)

--- Move in location list
mapk('n', '[j', ':lnext<CR>', opts)
mapk('n', '[k', ':lprevious<CR>', opts)
