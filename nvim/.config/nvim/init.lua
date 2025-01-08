-- Set runtime paths
vim.opt.runtimepath:prepend("~/.vim")
vim.opt.runtimepath:append("~/.vim/after")
vim.o.packpath = vim.o.runtimepath

vim.cmd("source ~/.vimrc")

vim.g.mapleader = " "

require("plugins.init")
require("keymaps")
