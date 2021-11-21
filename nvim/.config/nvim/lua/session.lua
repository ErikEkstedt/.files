local Job = require "plenary.job"
local Path = require "plenary.path"
local scan = require "plenary.scandir"
local notify = require("notify")

local global_variable_prefix = "session_"
local default_session_root = vim.fn.stdpath("config") .. "/sessions"

local config = {
  root = default_session_root,
  auto_save = false,
  auto_load = false,
  custom_dirs = {},
  path_replacer = "__",
  colon_replacer = "++",
  ext = ".vim",
  verbose = true
}
-- TODO: create a M.setup() like a regular plugin

local M = {}
M.config = config
M.log = {}

-- Utils
local function open_with_args()
  -- Only covers filename argv and not all flags/arguments/commands
  -- e.g. `nvim -c 'Telescope find_files' is not covered`
  return next(vim.fn.argv()) ~= nil
end

local function open_with_pager()
  return vim.g.in_pager_mode == 1
end

local function get_git_root()
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

local function option_to_g_variables(option)
  return global_variable_prefix .. option
end

local function set_options_g_variable(option, value)
  local global_var = option_to_g_variables(option)
  vim.g[global_var] = value
end

function M.setup(opts)
  -- update config
  if not vim.F.if_nil then
    for option, value in pairs(opts) do
      M.config[option] = value
    end
  end

  -- set global variables
  for option, value in pairs(M.config) do
    set_options_g_variable(option, value)
  end
end

function M.log_entry(text)
  local time = os.date "%H:%M:%S"
  table.insert(M.log, time .. ": " .. text)
end

function M.log_print()
  -- update config
  notify(M.log, "info", {title = "Session Log", timeout = 2000})
end

function M.print_g_variables()
  local g_name = ""
  local text = ""

  for option, _ in pairs(M.config) do
    g_name = option_to_g_variables(option)
    text = text .. "vim.g." .. g_name .. ": " .. vim.inspect(vim.g[g_name]) .. "\n"
  end
  g_name = option_to_g_variables("did_load")
  text = text .. "vim.g." .. g_name .. ": " .. vim.inspect(vim.g[g_name]) .. "\n"
  notify(text, "info", {title = "Session Variables", timeout = 2000})
end

function M.get_project_root()
  --[[
  Project root is either the root of GIT repository or the current working directory.

  If we are not in a git repo we only have sessions available for explicitly defined
  directoris listed in `config['custom_dirs']`.

  If we are not in a git repo or in a custom directory we return nil
  Otherwise we return the project path
  ]]
  local project_root = false
  local git_root = get_git_root()

  -- if we are not in a git repository check if we are in custom
  if git_root then
    project_root = git_root
  else
    local pwd = vim.fn.expand("$PWD")
    for _, value in ipairs(M.config.custom_dirs) do
      if pwd == value then
        project_root = pwd
      end
    end
  end

  return project_root
end

function M.dir_to_filename(session_cwd)
  session_cwd = session_cwd:gsub(":", M.config.colon_replacer)
  session_cwd = session_cwd:gsub(Path.path.sep, M.config.path_replacer)
  return session_cwd
end

function M.filename_to_dir(session_cwd)
  session_cwd = session_cwd:gsub(M.config.colon_replacer, ":")
  session_cwd = session_cwd:gsub(M.config.path_replacer, Path.path.sep)
  return session_cwd
end

function M.swap_session_file_post_fix(filepath)
  --[[
  I use swap files (don't really use them but have them available)
  see `lua/settings.lua`
  Following Greg Hurrell: https://youtu.be/fm33-Pas7vI?t=193
  utilizing 'autocmd on focus', 'checktime', 'autoread'
  However, `mksession` sets `shortmess=aoO` and so we get
  the regular (annoying) swap message during the SessionLoad
  Therefore we overwrite (with sed) -> `shortmess=aoOA` after the `mksession!` call
  ]]
  Job:new(
    {
      command = "sed",
      args = {"-i", "s/shortmess.aoO/shortmess=aoOA/g", filepath},
      on_stderr = function(j)
        notify("sed on_stderr" .. filepath, "error", {title = "Session sed", timeout = 1000})
      end
    }
  ):start() -- or start()
end

-- Commands
function M.SessionSave()
  M.log_entry("SessionSave")
  local session_path = M.get_project_root()

  if not session_path then
    notify(vim.fn.expand("$PWD"), "error", {title = "Bad Session", timeout = 2000})
    return nil
  end

  -- get the project session path
  local session_filename = M.dir_to_filename(session_path)
  local sessions_root = Path:new(vim.fn.expand(M.config["root"]))
  local session_filepath = sessions_root:joinpath(session_filename).filename .. M.config.ext

  -- Create sessions folder if it does not exists
  if not sessions_root:is_dir() then
    sessions_root:mkdir()
  end

  -- pre-hooks

  -- save session
  vim.cmd("mks! " .. session_filepath)

  if M.config["verbose"] then
    notify("mks! " .. session_filepath, "info", {title = "Session Saved", timeout = 2000})
  end

  -- Overwrite mksession-file for swap troubles
  -- shortmess=aoO -> shortmess=aoOA
  M.swap_session_file_post_fix(session_filepath)

  -- We saved the session and so we set the {prefix}_auto_save vim-global-variable to true
  -- to update the session accordingly
  set_options_g_variable("auto_save", true)

  -- post-hooks
end

function M.SessionLoad()
  M.log_entry("SessionLoad")
  local session_cwd = M.get_project_root()

  -- don't load anything if we don't have any files
  if not session_cwd then
    return nil
  end

  -- messy code to get the filepath
  -- Path can probably be used better
  local session_filename = M.dir_to_filename(session_cwd)
  local sessions_root = Path:new(vim.fn.expand(config["root"]))
  local session_filepath = sessions_root:joinpath(session_filename).filename .. config.ext
  session_filepath = Path:new(session_filepath)

  -- abort if the file don't exist or isn't readable
  if not session_filepath:is_file() or not vim.fn.filereadable(session_filepath.filename) then
    return nil
  end

  local cmd = "source " .. session_filepath.filename
  local success, result = pcall(vim.cmd, cmd)

  if not success then
    notify("Error restoring session", "error", {title = "source " .. session_filepath.filename})
    notify("result: " .. vim.inspect(result), "error", {title = "result "})
    return
  end
  -- if successfully loaded the Session we also update it on exit
  -- config.auto_save = true
  -- this is not triggered on `nvim -c "SessionLoad"`
  set_options_g_variable("auto_save", true)
  set_options_g_variable("did_load", true)
  M.log_entry("set auto_save=true")
  M.log_entry("set session_did_load=true")
  -- require("utils").DN("set save variable: " .. vim.inspect(vim.g.session_auto_save))
end

function M.SessionList()
  -- list the sessions in config['root']
  -- Show the cwd path and/or the session_filepath
  local text = ""
  -- local sessions = scan.scan_dir(config["root"], {hidden = true, depth = 1})
  for _, path in ipairs(scan.scan_dir(config["root"], {hidden = true, depth = 1})) do
    path = path:gsub(config["root"] .. "/", "")
    path = M.filename_to_dir(path)
    text = text .. path .. "\n"
  end
  notify(text, "info")
end

-- Autocommands
function M.SessionOnVimLeave()
  local auto_save = option_to_g_variables("auto_save")
  if vim.g[auto_save] then
    M.SessionSave()
  end
end

function M.SessionOnVimEnter()
  M.log_entry("SessionOnVimEnter")
  M.log_entry("vim.argv: " .. vim.inspect(vim.fn.argv()))
  M.log_entry("open_with_args: " .. vim.inspect(open_with_args()))
  M.log_entry("open_with_pager: " .. vim.inspect(open_with_pager()))
  M.log_entry("config.auto_load: " .. vim.inspect(M.config.auto_load))
  M.log_entry("vim.g.session_did_load: " .. vim.inspect(vim.g.session_did_load))

  -- local did_load = vim.g.session_did_load or 0 or nil
  -- if we have already load a session we do not have to do anything
  if vim.g.session_did_load then
    return nil
  end

  -- if we open with args (not as robust as I want) or we are in pager mode
  -- we turn off auto_save
  if open_with_args() or open_with_pager() then
    set_options_g_variable("auto_save", false)
    return nil
  end

  -- If we should auto-load we do that
  if M.config.auto_load then
    M.SessionLoad()
  end
end

-- Extension
-- autocomplete arguments to SessionLoad that searches the `session_root` and populates entries
-- with their real path-names but then finds the corresponding session_path

return M
