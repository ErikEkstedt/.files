-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local tmux = require("custom.tmux")
local ns = { noremap = true, silent = true }

-- Tmux movement
vim.keymap.set("n", "<M-h>", tmux.move_left, ns)
vim.keymap.set("n", "<M-j>", tmux.move_down, ns)
vim.keymap.set("n", "<M-k>", tmux.move_up, ns)
vim.keymap.set("n", "<M-l>", tmux.move_right, ns)

vim.keymap.set("n", "<C-w>z", tmux.zoom, ns)

-- General
-- Move end/start of line
vim.keymap.del("n", "<S-h>")
vim.keymap.del("n", "<S-l>")
vim.keymap.set("n", "L", "$", ns)
vim.keymap.set("n", "H", "^", ns)

-- vim.keymap.set("n", "<leader><leader>", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
vim.keymap.set("n", "<Leader><Leader>", ":b#<CR>", ns)
vim.keymap.set("n", "<C-q>", "<cmd>qa<CR>", ns)
