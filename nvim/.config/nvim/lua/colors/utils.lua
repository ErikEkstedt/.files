local _, c, Group, g, style = require("colorbuddy").setup()

local M = {}

M.italics = (function()
  if vim.g.onebuddy_disable_italics ~= true then
    return style.italic
  else
    return style.NONE
  end
end)()

return M
