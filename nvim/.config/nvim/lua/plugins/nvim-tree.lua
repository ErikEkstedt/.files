require("nvim-tree").setup {}

vim.cmd("highlight! link NvimTreeFolderIcon String")
vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>lua require('nvim-tree').toggle()<CR>", {noremap = true, silent = true})
