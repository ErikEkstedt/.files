-- Hop.nvim
-- get characters over all words and jump their on press.
vim.api.nvim_set_keymap('n', '<Leader>j', ':HopLine<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<Leader>k', ':HopLine<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<Leader>h', ':HopWord<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<Leader>l', ':HopWord<CR>', {noremap=true, silent=true})
