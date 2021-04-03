-- Init.lua

-- set mapleader early prior to plugins
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- Load plugins (specific plugin settings lua/plugins/<plugName>.lua)
require('plugins')
require('plugins.nvim-bufferline') -- Error in packercompile

-- options/settings
require('settings')

-- Python
vim.g.HOME = vim.fn.expand('$HOME')
vim.g.loaded_python_provider = 0
vim.g.python3_host_prog=vim.g.HOME .. '/miniconda3/envs/neovim3/bin/python'
vim.g.python_host_bin=vim.g.HOME .. '/miniconda3/envs/neovim3/bin'
vim.g.python_host_prog=vim.g.HOME .. '/miniconda3/envs/neovim2/bin/python'
vim.g.BROWSER	= 'brave-browser'

-- Mappings Normal etc
require('mappings')

-- Automatically resize when vim changes
vim.cmd([[au VimResized * exe "normal! \<c-w>="]])

-- Highlight text when yank. Built in lua.
vim.cmd([[au! TextYankPost * silent! lua vim.highlight.on_yank {higroup="DiffAdd", timeout=500}]])

-- Set Colorscheme
vim.cmd('colorscheme onebuddy')
