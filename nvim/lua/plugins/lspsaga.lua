local saga = require 'lspsaga'

saga.init_lsp_saga({
	border_style = 2,
	use_saga_diagnostic_sign = false,
	max_preview_lines = 100,
	finder_action_keys = {
		open = '<CR>',
		vsplit = '<C-l>',
		split = '<C-j>',
	}
})

--- mappings
vim.api.nvim_set_keymap('n', 'ge', ":Lspsaga lsp_finder<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'K', ":Lspsaga hover_doc<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>ca', ":Lspsaga code_action<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>dl', ":Lspsaga show_line_diagnostics<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>dd', ":Lspsaga show_cursor_diagnostics<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gs', ":Lspsaga signature_help<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gj', ":Lspsaga diagnostic_jump_next<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gk', ":Lspsaga diagnostic_jump_prev<CR>", {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', '<C-f>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', '<C-b>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", {noremap = true, silent = true})
