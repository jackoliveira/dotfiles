vim.g.mapleader = " "
vim.cmd([[ set encoding=utf-8 ]])

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

vim.opt.showcmd = true
vim.opt.number = true

vim.opt.guicursor = ""

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

-- set termguicolors to enable highlight groups
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

vim.opt.guifont = { 'Dank Mono Nerd Font', 'SF Mono', 'M PLUS 1 Code', 'Terminess Nerd Font', 'M+1 Code Nerd Font' }
