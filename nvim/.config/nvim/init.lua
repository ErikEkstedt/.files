-- Init.lua
-- options/settings

-- set mapleader early prior to plugins
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Load plugins (specific plugin settings lua/plugins/<plugName>.lua)
require("plugins")

-- options/settings
require("settings")

-- Python
vim.g.HOME = vim.fn.expand("$HOME")
vim.g.loaded_python_provider = 0
vim.g.python3_host_prog = vim.g.HOME .. "/miniconda3/envs/neovim3/bin/python"
vim.g.python_host_bin = vim.g.HOME .. "/miniconda3/envs/neovim3/bin"
vim.g.BROWSER = "brave-browser"

-- Mappings Normal etc
require("mappings")

-- Set Colorscheme
-- require("colorbuddy").setup()
-- BUG: why does everything break if I don't load a colorscheme?
require("colorbuddy").colorscheme("one_dark_custom")

-- Custom Session (mksession, Auto-Session, etc)
require("session").setup()

-- Cursor i want reversed colors but need to check kitty/tmux etc
-- vim.opt.guicursor = "n-v-c-sm:block-Cursor,i-ci-ve:ver25,r-cr-o:hor20"
