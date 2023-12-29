--  https://github.com/jpalardy/vim-slime
return {
  "jpalardy/vim-slime",
  config = function()
    vim.g.slime_target = "tmux"
    vim.g.slime_default_config = { socket_name = "default", target_pane = "{right-of}" }
    vim.g.slime_python_ipython = 1
    vim.g.slime_no_mappings = 1

    --Required to transfer data from vim to GNU screen or tmux. Set to "$HOME/.slime_paste" by default.
    -- vim.g.slime_paste_file=vim.fn.tempname()

    vim.keymap.set("n", "<CR>", "<Plug>SlimeParagraphSend", {})
    vim.keymap.set("x", "<CR>", "<Plug>SlimeRegionSend", {})
    vim.keymap.set("n", "<C-C><C-x>", "<Plug>SlimeConfig", {})
    vim.keymap.set("n", "<C-C><C-C>", "<Plug>SlimeLineSend", {})
    vim.keymap.set("x", "<C-C><C-C>", "<Plug>SlimeRegionSend", {})
  end,
}
