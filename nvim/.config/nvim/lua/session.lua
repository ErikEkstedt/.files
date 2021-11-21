local Path = require "plenary.path"
local utils = require("utils")
local notify = require("notify")
local Job = require "plenary.job"
local default_session_root = vim.fn.stdpath("config") .. "/sessions"

local config = {
  root = default_session_root,
  auto_save = true,
  auto_load = false,
  custom_dirs = {},
  path_replacer = "__",
  colon_replacer = "++",
  ext = ".vim",
  verbose = true
}

--[[
-- 1. load on start
-- - check if current session_file exists
--  - if it exists we load the session
-- - else we do nothing
-- 2. Save session
--  - mksession
--  - change the line cpo=aoO -> cpo=aoOA
--  - so swap files is not a problem
-- 3. Restore session
--  - autocmd to check if session file exists
--  - run mkview or source $SessionPath
--]]
-- Utils
local function open_with_args()
  return next(vim.fn.argv()) ~= nil
end

local function open_with_pager()
  return vim.g.in_pager_mode == 1
end

-- Plugin
local M = {}

function M.is_valid_dir()
  -- Check if the current working directory is a git repository or if it is in config['custom_dirs']
  -- If not then we return a nil value
  -- If the checks are true we return the path to the session file
  local project_root = false
  local git_root = utils.get_git_root()

  -- if we are not in a git repository check if we are in custom
  if git_root then
    project_root = git_root
  else
    local pwd = vim.fn.expand("$PWD")
    for _, value in ipairs(config.custom_dirs) do
      if pwd == value then
        project_root = pwd
      end
    end
  end

  return project_root
end

function M.dir_to_session_filename(session_cwd)
  session_cwd = session_cwd:gsub(":", config.colon_replacer)
  session_cwd = session_cwd:gsub(Path.path.sep, config.path_replacer)
  return session_cwd
end

function M.swap_session_file_post_fix(filepath)
  Job:new(
    {
      command = "sed",
      args = {"-i", "s/shortmess.aoO/shortmess=aoOA/g", filepath},
      on_exit = function(j)
        notify("sed on_exit" .. filepath, "info", {title = "Session sed", timeout = 1000})
      end,
      on_stderr = function(j)
        notify("sed on_stderr" .. filepath, "error", {title = "Session sed", timeout = 1000})
        -- utils.DN(j)
      end
    }
  ):start() -- or start()
end

function M.SessionSave()
  local session_cwd = M.is_valid_dir()

  if not session_cwd then
    notify(vim.fn.expand("$PWD"), "errot", {title = "Bad Session", timeout = 2000})
    return nil
  end

  local session_filename = M.dir_to_session_filename(session_cwd)
  local sessions_root = Path:new(vim.fn.expand(config["root"]))
  local session_filepath = sessions_root:joinpath(session_filename).filename .. config.ext

  -- Config Sessions Root
  -- Create sessions folder if it does not exists
  if not sessions_root:is_dir() then
    sessions_root:mkdir()
  end

  -- pre-hooks

  -- save session
  vim.cmd("mks! " .. session_filepath)

  if config["verbose"] then
    notify("mks! " .. session_filepath, "info", {title = "Session Saved", timeout = 2000})
  end

  -- shortmess=aoO -> shortmess=aoOA
  M.swap_session_file_post_fix(session_filepath)

  -- temporary
  config.auto_save = true

  -- post-hooks
end

function M.SessionLoad()
  local session_cwd = M.is_valid_dir()

  -- don't load anything if we don't have any files
  if not session_cwd then
    return nil
  end

  local session_filename = M.dir_to_session_filename(session_cwd)
  local sessions_root = Path:new(vim.fn.expand(config["root"]))
  local session_filepath = sessions_root:joinpath(session_filename).filename .. config.ext
  session_filepath = Path:new(session_filepath)

  if session_filepath:is_file() and vim.fn.filereadable(session_filepath.filename) then
    local filepath = session_filepath.filename

    local cmd = "source " .. filepath
    local success, _ = pcall(vim.cmd, cmd)

    if not success then
      notify("Error restoring session", "error", {title = "source " .. filepath})
      return
    end
    config.auto_save = true
  end
end

function M.SessionOnVimLeave()
  if config.auto_save and not open_with_pager() then
    config.verbose = false
    M.SessionSave()
  end
end

function M.SessionOnVimEnter()
  -- print("Session Plugin")
  -- print("open_with_args: " .. vim.inspect(open_with_args()))
  -- print("open_with_pager: " .. vim.inspect(open_with_pager()))
  if open_with_args() or open_with_pager() or not config.auto_load then
    config.auto_save = false
    return nil
  end
  M.SessionLoad()
end

return M
