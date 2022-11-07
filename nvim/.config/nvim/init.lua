-- Init.lua
vim.g.HOME = vim.fn.expand("$HOME")
vim.g.loaded_python_provider = 0
vim.g.python3_host_prog = vim.g.HOME .. "/miniconda3/envs/neovim3/bin/python"
vim.g.python_host_bin = vim.g.HOME .. "/miniconda3/envs/neovim3/bin"
vim.g.BROWSER = "brave-browser"

-- set mapleader early prior to plugins
vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.g.ts_highlight_lua = true
vim.g.minimal_plugin = false -- used in plugins/init.lua

-- Load plugins (specific plugin settings lua/plugins/<plugName>.lua)
require("plugins")

-- Custom "plugins"
require("custom.session").setup() -- Session (mksession, Auto-Session, etc)

-- options/settings
require("settings")

-- Mappings Normal etc
require("mappings")

-- Set Colorscheme
require("theme")
-- Cursor i want reversed colors but need to check kitty/tmux etc
-- vim.opt.guicursor = "n-v-c-sm:block-Cursor,i-ci-ve:ver25,r-cr-o:hor20"
