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

-- options/settings
require("settings")

-- Mappings Normal etc
require("mappings")

-- Set Colorscheme
-- require("colorbuddy").colorscheme("custom.one_dark_custom")
-- require("colorbuddy").colorscheme("colors.one_dark")
local palette = require("monokai").classic
require("monokai").setup {
  -- palette = require("monokai").classic,
  palette = {
    name = "monokai",
    base1 = "#272a30",
    base2 = "#222426",
    base3 = "#2E323C",
    base4 = "#333842",
    base5 = "#4d5154",
    base6 = "#9ca0a4",
    base7 = "#b1b1b1",
    border = "#a1b5b1",
    brown = "#504945",
    white = "#ffffff",
    grey = "#8F908A",
    black = "#000000",
    pink = "#f92672",
    green = "#a6e22e",
    aqua = "#66d9ef",
    yellow = "#e6db74",
    orange = "#fd971f",
    purple = "#ae81ff",
    red = "#e95678",
    diff_add = "#3d5213",
    diff_remove = "#4a0f23",
    diff_change = "#27406b",
    diff_text = "#23324d"
  },
  custom_hlgroups = {
    -- TSVariable = {fg = palette.green},
    TSParameter = {fg = palette.green},
    include = {fg = palette.pink, style = "bold"},
    keyword = {fg = palette.pink, style = "bold"},
    type = {fg = palette.aqua, style = "bold"},
    -- TSField = {fg = palette.aqua},
    DiffChange = {bg = "NONE"}
  }
}

-- Custom "plugins"
-- Session (mksession, Auto-Session, etc)
require("custom.session").setup()

-- Cursor i want reversed colors but need to check kitty/tmux etc
-- vim.opt.guicursor = "n-v-c-sm:block-Cursor,i-ci-ve:ver25,r-cr-o:hor20"
