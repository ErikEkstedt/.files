-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local tmux = require("custom.tmux")
local ns = { noremap = true, silent = true }

-- Delete lazyvim keymaps
vim.keymap.del("n", "<Leader>fn") -- create new file -> fno/fnw find notes

-- Tmux movement
vim.keymap.set("n", "<C-w>z", tmux.zoom, ns)
vim.keymap.set("n", "<M-h>", tmux.move_left, ns)
vim.keymap.set("n", "<M-j>", tmux.move_down, ns)
vim.keymap.set("n", "<M-k>", tmux.move_up, ns)
vim.keymap.set("n", "<M-l>", tmux.move_right, ns)

-- General
vim.keymap.set("n", "<C-q>", "<cmd>q<CR>", ns)
vim.keymap.set("n", "<M-q>", "<cmd>qa!<CR>", ns)
vim.keymap.set("n", "ga", "za", ns)

-- Diagnostics
vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, { desc = "Next Diagnostics" })
vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, { desc = "Prev Diagnostics" })

-- Move end/start of line
vim.keymap.del("n", "<S-h>")
vim.keymap.del("n", "<S-l>")
vim.keymap.set("n", "L", "$", ns)
vim.keymap.set("n", "H", "^", ns)

-- Goto next under cursor
vim.keymap.set("n", "gn", "*zvzz", ns)
vim.keymap.set("n", "gN", "#zvzz", ns)

-- */# stays on current word
vim.keymap.set("n", "*", "*<C-o>", ns)
vim.keymap.set("n", "#", "#<C-o>", ns)

-- TODO: macro?
-- split lines
vim.keymap.set("n", "gl", "f, a<CR><esc>", ns)

-- Buffers
vim.keymap.set("n", "<Leader><Leader>", ":b#<CR>", ns)
vim.keymap.set("n", "<Leader>n", ":bnext<CR>", ns)
vim.keymap.set("n", "<Leader>N", ":bl<CR>", ns)
vim.keymap.set("n", "<Leader>p", ":bprev<CR>", ns)
vim.keymap.set("n", "<Leader>P", ":bf<CR>", ns)
vim.keymap.del("n", "<Leader>bb")
vim.keymap.set("n", "<Leader>bb", ":bprev<CR>", ns)
vim.keymap.set("n", "<Leader>D", ":bd<CR>", ns)

-- Fold
vim.keymap.set("n", "<Leader>z", "za", ns)
