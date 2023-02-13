-- Init.lua
vim.g.HOME = vim.fn.expand("$HOME")
vim.g.loaded_python_provider = 0
vim.g.python3_host_prog = vim.fn.expand("$HOME/miniconda3/envs/neovim3/bin/python")
vim.g.python_host_bin = vim.fn.expand("$HOME/miniconda3/envs/neovim3/bin")
vim.g.BROWSER = "brave-browser"

-- set mapleader early prior to plugins
vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.g.ts_highlight_lua = true

-- options/settings
require("settings")

-- Warning: setup leader keys prior to this (happens in init.lua)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system(
    {
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath
    }
  )
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {ui = {border = "single"}})

-- Mappings Normal etc
require("mappings")

-- -- Custom "plugins"
require("custom.session").setup() -- Session (mksession, Auto-Session, etc)

-- Set Colorscheme
require("theme")
-- Cursor i want reversed colors but need to check kitty/tmux etc
-- vim.opt.guicursor = "n-v-c-sm:block-Cursor,i-ci-ve:ver25,r-cr-o:hor20"
