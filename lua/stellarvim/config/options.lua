vim.g.mapleader = " "
vim.g.maplocalleader = "+"

local opt = vim.opt

-- Editor
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
opt.confirm = true
opt.cursorline = true
opt.number = true
opt.relativenumber = true
opt.ruler = false
opt.scrolloff = 4
opt.showmode = false
opt.sidescrolloff = 8
opt.signcolumn = "yes"
opt.termguicolors = true
opt.timeoutlen = vim.g.vscode and 1000 or 300
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200
opt.virtualedit = "block"
opt.wrap = false

-- Indentation
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2

opt.mouse = "a"

opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"

-- Search
opt.ignorecase = true
opt.smartcase = true
