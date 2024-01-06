vim.g.python3_host_prog = vim.fn.expand("$HOME/miniconda3/envs/neovim3/bin/python")
vim.g.python_host_bin = vim.fn.expand("$HOME/miniconda3/envs/neovim3/bin")

-- set mapleader early prior to plugins
vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require("config.options")
require("config.keymaps")
require("config.autocmds")
require("lazy").setup("plugins", {
  ui = {border = "single"},
  install = {
      -- install missing plugins on startup. This doesn't increase startup time.
      missing = true,
      -- try to load one of these colorschemes when starting an installation during startup
      colorscheme = { "kanagawa" },
    },
})
