-- Prettier
vim.cmd('let g:prettier#quickfix_auto_focus=0')
vim.api.nvim_set_keymap('n', '<LocalLeader>pr', ':Prettier<CR>', {noremap=true})
