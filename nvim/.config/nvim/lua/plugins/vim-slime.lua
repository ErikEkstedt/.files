--  https://github.com/jpalardy/vim-slime

-- Directionality using tmux
-- Token                  Meaning
-- {last}            !    The last (previously active) pane
-- {next}            +    The next pane by number
-- {previous}        -    The previous pane by number
-- {top}                  The top pane
-- {bottom}               The bottom pane
-- {left}                 The leftmost pane
-- {right}                The rightmost pane
-- {top-left}             The top-left pane
-- {top-right}            The top-right pane
-- {bottom-left}          The bottom-left pane
-- {bottom-right}         The bottom-right pane
-- {up-of}                The pane above the active pane
-- {down-of}              The pane below the active pane
-- {left-of}              The pane to the left of the active pane
-- {right-of}             The pane to the right of the active pane
return {
  "jpalardy/vim-slime",
  config = function()
    vim.g.slime_target = "tmux"
    vim.g.slime_default_config = { socket_name = "default", target_pane = "{right-of}" }
    vim.g.slime_python_ipython = 1
    vim.g.slime_no_mappings = 1

    --Required to transfer data from vim to GNU screen or tmux. Set to "$HOME/.slime_paste" by default.
    -- vim.g.slime_paste_file=vim.fn.tempname()

    vim.keymap.set("n", "<C-C><C-x>", "<Plug>SlimeConfig", {})
    vim.keymap.set("n", "<C-C><C-C>", "<Plug>SlimeLineSend", {})
    vim.keymap.set("x", "<C-C><C-C>", "<Plug>SlimeRegionSend", {})
  end,
}