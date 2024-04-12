local Job = require("plenary.job")

local M = {}

function M.split_string(inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t = {}
  for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
    table.insert(t, str)
  end
  return t
end

function M.get_uname()
  return vim.fn.system("uname"):gsub("\n", "")
end

function M.get_git_root()
  local folder = nil
  Job:new({
    command = "git",
    args = { "rev-parse", "--show-toplevel" },
    on_exit = function(j)
      for index, value in ipairs(j:result()) do
        if index == 1 then
          folder = value
        end
      end
    end,
  }):sync() -- or start()
  return folder
end

return M
