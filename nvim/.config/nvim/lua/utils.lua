local Job = require "plenary.job"
local notify = require("notify")

local M = {}

-- Helpers
function M.get_uname()
  return vim.fn.system("uname"):gsub("\n", "")
end

function M.get_git_root()
  local folder = nil
  Job:new(
    {
      command = "git",
      args = {"rev-parse", "--show-toplevel"},
      on_exit = function(j)
        for index, value in ipairs(j:result()) do
          if index == 1 then
            folder = value
          end
        end
      end
    }
  ):sync() -- or start()
  return folder
end

-- Notify
function M.DN(v, cm)
  local time = os.date "%H:%M"
  local context_msg = cm or " "
  local msg = context_msg .. " " .. time
  notify(vim.inspect(v), "debug", {title = {"Debugger", msg}})
  return v
end

function M.yank_current_filepath()
  local filename = vim.api.nvim_buf_get_name(0)
  local input_pipe = vim.loop.new_pipe(false)
  local copy_cmd = "xclip"
  local args = {"-selection", "clipboard"}

  if M.get_uname() == "Darwin" then
    copy_cmd = "pbcopy"
    args = {}
  end

  local yanker =
    Job:new {
    writer = input_pipe,
    command = copy_cmd,
    args = args
  }
  yanker:start()
  input_pipe:write(filename)
  input_pipe:close()
  yanker:shutdown()
  notify(vim.inspect(filename), "info", {title = "Copied filepath to clipboard"})
end

function M.yank_current_line()
  local line = vim.api.nvim_get_current_line()
  vim.api.nvim_feedkeys('"+yy', "n", true)
  notify(vim.inspect(line), "info", {title = "Copied to clipboard", timeout = 1000})
end

function M.notify_cwd()
  notify(vim.inspect(vim.fn.expand("$PWD")), "info", {title = "CWD"})
end

return M
