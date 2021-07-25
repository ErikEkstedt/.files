-- Init.lua

-- set mapleader early prior to plugins
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Load plugins (specific plugin settings lua/plugins/<plugName>.lua)
require("plugins")
require("plugins.nvim-bufferline") -- Error in packercompile

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
require("colorbuddy").colorscheme("onebuddy")

-- Colorscheme clears hi for hop?
vim.cmd("hi HopNextKey gui=bold guifg=cyan")
vim.cmd("hi HopNextKey1 gui=bold guifg=cyan")
vim.cmd("hi HopNextKey2 gui=bold guifg=#FF0088")
vim.cmd("hi VertSplit guifg=#61afef")
-- vim.g.gruvbox_flat_style = "dark"
-- vim.g.gruvbox_sidebars = { "qf", "vista_kind", "terminal", "packer" }
-- vim.cmd('colorscheme gruvbox-flat')
-- -- does not work but is what i want Init
-- vim.cmd([[
-- hi Folded guibg=NONE'
-- hi PmenuSel guibg=cyan guifg=black
-- ]])
