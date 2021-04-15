--  https://github.com/jpalardy/vim-slime

vim.g.slime_default_config={socket_name='default', target_pane='{right-of}'}

-- vim.g.slime_paste_file=vim.fn.tempname()
vim.g.slime_target='tmux'
vim.g.slime_python_ipython=1

vim.api.nvim_set_keymap('x', '<C-C><C-C', ':SlimeSend1<CR>', {})
vim.api.nvim_set_keymap('x', '<CR>', ':SlimeSend<CR>', {})
vim.api.nvim_set_keymap('n', '<C-C><C-C>', ':SlimeSend1<CR>', {})
vim.api.nvim_set_keymap('n', '<C-C><C-x>', ':SlimeConfig<CR>', {})

-- xmap <cr> <Plug>SlimeRegionSend
-- xmap <c-c><c-c> <Plug>SlimeRegionSend
-- nmap <c-c><c-c> <Plug>SlimeLineSend
-- nmap <c-c><c-x> <Plug>SlimeConfig

-- vim.g.slimux_python_use_ipython = 1
-- vim.api.nvim_set_keymap('n', '<C-c><C-c>', ':SlimuxREPLSendLine<CR>', {noremap=true})
-- vim.api.nvim_set_keymap('v', '<C-c><C-c>', ':SlimuxREPLSendLine<CR>gv<esc>zz', {noremap=true})
-- vim.api.nvim_set_keymap('n', '<C-c><C-x>', ':SlimuxREPLConfigure<CR>', {noremap=true})
