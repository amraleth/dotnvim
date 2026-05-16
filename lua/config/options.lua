vim.g.mapleader          = " "
vim.g.maplocalleader     = "\\"

local opt                = vim.opt

opt.number               = true
opt.relativenumber       = true
opt.signcolumn           = "yes"

opt.termguicolors        = true
opt.showmode             = false
opt.laststatus           = 3
opt.scrolloff            = 8
opt.pumheight            = 10
opt.cmdheight            = 1
opt.wrap                 = false
opt.linebreak            = true

opt.expandtab            = true
opt.shiftwidth           = 4
opt.tabstop              = 4
opt.softtabstop          = 4
opt.smartindent          = true
opt.breakindent          = true

opt.ignorecase           = true
opt.smartcase            = true
opt.hlsearch             = true
opt.incsearch            = true
opt.inccommand           = "split"

opt.clipboard            = "unnamedplus"
opt.undofile             = false
opt.undolevels           = 10000
opt.swapfile             = true
opt.backup               = false
opt.confirm              = true
opt.mouse                = "a"
opt.virtualedit          = "block"

opt.updatetime           = 250
opt.timeoutlen           = 300

opt.splitright           = true
opt.splitbelow           = true
opt.splitkeep            = "screen"

opt.completeopt          = "menu,menuone,noselect"

opt.foldmethod           = "expr"
opt.foldexpr             = "v:lua.vim.treesitter.foldexpr()"
opt.foldlevel            = 99
opt.foldenable           = true

vim.g.netrw_banner       = 0
vim.g.netrw_liststyle    = 3
vim.g.netrw_winsize      = 25
vim.g.netrw_browse_split = 0
