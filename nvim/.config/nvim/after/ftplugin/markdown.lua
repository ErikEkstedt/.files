-- vim.opt_local.spell = true # its annoying
vim.opt.linebreak = true

vim.api.nvim_buf_set_keymap(0, "n", "<CR>", "<cmd>lua require('neuron').enter_link()<CR>", {silent = true})
