local get_lsp_client = function(msg)
  msg = msg or "LSP Inactive"
  local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
  local clients = vim.lsp.get_active_clients()
  if next(clients) == nil then
    return msg
  end
  local lsps = ""
  for _, client in ipairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
      -- print(client.name)
      if lsps == "" then
        -- print("first", lsps)
        lsps = client.name
      else
        -- print("more", lsps)
        if not string.find(lsps, client.name) then
          lsps = lsps .. ", " .. client.name
        end
      end
    end
  end
  if lsps == "" then
    return msg
  else
    return lsps
  end
end

-- chris@machine: https://github.com/ChristianChiarulli/LunarVim/blob/rolling/lua/core/galaxyline.lua
local function env_cleanup(venv)
  if string.find(venv, "/") then
    local final_venv = venv
    for w in venv:gmatch("([^/]+)") do
      final_venv = w
    end
    venv = final_venv
  end
  return venv
end

-- PythonEnv
local function get_pyright_env()
  local utils = require("custom.utils")
  local repo_root = utils.get_git_root()
  if not repo_root then
    return nil
  end

  local pyright_path = repo_root .. "/pyrightconfig.json"

  local body, ret
  require("plenary.job")
    :new({
      command = "cat",
      args = { pyright_path },
      on_exit = function(j, return_val)
        ret = return_val
        body = j:result()
      end,
    })
    :sync() -- or start()

  if ret ~= 0 then
    return nil
  end

  local env = nil
  for _, field in pairs(body) do
    field = field:gsub("%s+", "")
    if string.match(field, '"venv"') ~= nil then
      env = utils.split_string(field, ":")[2]
      env = env:gsub('"', ""):gsub(",", ""):gsub("}", "")
    end
  end

  if not env then
    return nil
  end

  return env
end

local function get_python_env()
  if not vim.bo.filetype == "python" then
    return ""
  end
  local filename = vim.api.nvim_buf_get_name(0)
  local prefix = " "
  local suffix = ""

  -- cache: important to not call "cat on every statusupdate"
  if M[filename] then
    return prefix .. M[filename] .. suffix
  end

  local pyright = get_pyright_env()
  if pyright then
    M[filename] = pyright
    return prefix .. pyright .. suffix
  end

  local venv = os.getenv("CONDA_DEFAULT_ENV")
  if venv ~= nil then
    venv = env_cleanup(venv)
    M[filename] = venv
    return prefix .. venv .. suffix
  end
  venv = os.getenv("VIRTUAL_ENV")
  if venv ~= nil then
    venv = env_cleanup(venv)
    M[filename] = venv
    return prefix .. venv .. suffix
  end
  return ""
end

return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      -- options = {
      --   theme = "kanagawa",
      --   globalstatus = true,
      --   disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
      -- },
      sections = {
        lualine_y = {
          {
            get_python_env,
            cond = function()
              return vim.bo.filetype == "python"
            end,
          },
          { get_lsp_client, icon = "" },
        },
      },
    },
  },
}
