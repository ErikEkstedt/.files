-- Hop.nvim
require "hop".setup()

-- get characters over all words and jump their on press.
vim.api.nvim_set_keymap("n", "<Leader>j", ":HopLineStartAC<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>k", ":HopLineStartBC<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>h", ":HopWordCurrentLineBC<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>l", ":HopWordCurrentLineAC<CR>", {noremap = true, silent = true})
