-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.loaded_python_provider = 0
vim.g.python3_host_prog = "$HOME/miniconda3/bin/python"
vim.g.python_host_bin = vim.fn.expand("$HOME/miniconda3/envs/neovim3/bin")

-- vim.opt/vim.o
vim.o.sessionoptions = "buffers,help,tabpages,winsize,winpos,terminal"

vim.o.foldtext =
  [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) . ' (' . (v:foldend - v:foldstart + 1) . ' lines)']]

vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])