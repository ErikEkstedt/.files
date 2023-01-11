vim.g.indent_blankline_enabled = false
vim.g.indent_blankline_char = "|"
vim.api.nvim_set_keymap("n", "<Space>in", ":IndentBlanklineToggle!<CR>", { noremap = true, silent = true })
