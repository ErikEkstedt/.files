-- Tmux Movement
-- Moving from Tmuxinator vimscript
-- https://github.com/christoomey/vim-tmux-navigator
-- to -->
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- SOURCE: https://github.com/nathom/tmux.nvim
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

local M = {}

function Move(direction)
  -- Try to move to vim split
  local win_num_before = vim.fn.winnr()
  vim.cmd([[execute "wincmd ]] .. direction .. [["]])
  if vim.fn.winnr() == win_num_before then
    -- If the command did nothing, that means the current split
    -- is at the edge and we need to select the tmux pane
    MoveTmux(direction)
  end
end

function MoveTmux(direction)
  -- tmux selecttmux_move pane
  -- Convert from vim movement keys to Up, Left ... for tmux
  local tmux_map = {h = "L", j = "D", k = "U", l = "R"}
  local tmux_direction = tmux_map[direction]
  vim.cmd([[silent exec "!tmux selectp -]] .. tmux_direction .. [["]])
end

function M.move_left()
  Move("h")
end

function M.move_down()
  Move("j")
end

function M.move_right()
  Move("l")
end

function M.move_up()
  Move("k")
end

return M
