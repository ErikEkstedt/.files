local utils = require("utils")
local Job = require "plenary.job"

local M = {}
local colors = {
  green = "#95E454",
  blue = "#61afef",
  black = "#050505",
  magenta = "#E80FE7",
  red = "#e06c75",
  orange = "#DCB917",
  bg = "#3E3F42",
  -- bg = "2A2C30", -- "#2D3235",
  bg2 = "#2A2C30", -- "#2D3235",
  bg_inactive = "#27292B",
  bg_one_dark = "#1F2123",
  color2 = "#0f1419",
  color3 = "#ffee99",
  color4 = "#e6e1cf",
  color5 = "#14191f",
  color8 = "#f07178",
  color9 = "#3e4b59"
}
local theme = {
  visual = {
    a = {fg = colors.bg, bg = colors.orange, gui = "bold"}
  },
  replace = {
    a = {fg = colors.bg, bg = colors.red, gui = "bold"}
  },
  inactive = {
    a = {fg = colors.color4, bg = colors.bg_inactive},
    b = {fg = colors.color4, bg = colors.bg_inactive},
    c = {fg = colors.color4, bg = colors.bg_inactive},
    x = {fg = colors.color4, bg = colors.bg_inactive},
    y = {fg = colors.color4, bg = colors.bg_inactive},
    z = {fg = colors.color4, bg = colors.bg_inactive}
  },
  normal = {
    a = {fg = colors.black, bg = colors.blue, gui = "bold"},
    b = {fg = colors.magenta, bg = colors.bg, gui = "bold"},
    c = {fg = colors.blue, bg = colors.bg2, gui = "bold"},
    x = {fg = colors.green, bg = colors.bg2, gui = "bold"},
    y = {fg = colors.blue, bg = colors.bg, gui = "bold"},
    z = {fg = colors.blue, bg = colors.bg, gui = "bold"}
  },
  insert = {
    a = {fg = colors.color2, bg = colors.green, gui = "bold"}
  }
}

-- LSP
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
    for w in venv:gmatch "([^/]+)" do
      final_venv = w
    end
    venv = final_venv
  end
  return venv
end

-- PythonEnv
local function get_pyright_env()
  local repo_root = utils.get_git_root()
  if not repo_root then
    return nil
  end

  local pyright_path = repo_root .. "/pyrightconfig.json"

  local body, ret
  Job:new(
    {
      command = "cat",
      args = {pyright_path},
      on_exit = function(j, return_val)
        ret = return_val
        body = j:result()
      end
    }
  ):sync() -- or start()

  if ret ~= 0 then
    return nil
  end

  local env = nil
  for _, field in pairs(body) do
    field = field:gsub("%s+", "")
    if string.match(field, '"venv"') ~= nil then
      env = utils.split_string(field, ":")[2]
      env = env:gsub('"', ""):gsub(",", "")
    end
  end

  if not env then
    return nil
  end

  return env
end

local PythonEnv = function()
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

  local venv = os.getenv "CONDA_DEFAULT_ENV"
  if venv ~= nil then
    venv = env_cleanup(venv)
    M[filename] = venv
    return prefix .. venv .. suffix
  end
  venv = os.getenv "VIRTUAL_ENV"
  if venv ~= nil then
    venv = env_cleanup(venv)
    M[filename] = venv
    return prefix .. venv .. suffix
  end
  return ""
end

---------------------------------------------------
-- Sections
local inactive_different = {
  lualine_a = {
    {
      function()
        return " "
      end,
      separator = {left = ""},
      padding = {right = 0, left = 0}
    }
  },
  lualine_b = {},
  lualine_c = {
    {
      "filename",
      path = 2,
      fmt = function(str)
        local ret = "↑ " .. str .. " ↑"
        return ret
      end,
      shortening_target = 100
    }
  },
  lualine_x = {
    {
      "diagnostics",
      separator = {left = ""},
      left_padding = 2,
      sources = {"nvim_diagnostic"}
    }
  },
  lualine_y = {
    {
      "diff",
      symbols = {
        added = "  ",
        modified = " 柳",
        removed = "  "
      },
      padding = 0,
      separator = {right = ""}
    },
    {
      "branch",
      icon = "",
      padding = {left = 1, right = 0},
      separator = ""
    }
  },
  lualine_z = {
    {
      function()
        return " "
      end,
      separator = {right = ""},
      padding = {right = 0, left = 0}
    }
  }
}

local sections = {
  lualine_a = {
    {
      "mode",
      -- fmt = function(str)
      --   return str:sub(1, 1)
      -- end,
      separator = {left = "", right = ""},
      padding = {left = 0, right = 0}
    }
  },
  lualine_b = {
    {
      "branch",
      icon = "",
      padding = {left = 1, right = 1},
      separator = {right = ""}
    },
    {
      "diff",
      symbols = {
        added = "  ",
        modified = " 柳",
        removed = "  "
      },
      padding = 0,
      separator = {right = ""}
    }
  },
  lualine_c = {
    {
      "filename",
      file_status = true, -- displays file status (readonly status, modified status)
      path = 2, -- 0 = just filename, 1 = relative path, 2 = absolute path
      shorting_target = 5
    }
  },
  lualine_x = {
    {"diagnostics", sources = {"nvim_diagnostic"}},
    {PythonEnv},
    {get_lsp_client, icon = ""}
  },
  lualine_y = {
    {"filetype", separator = {left = ""}, padding = {left = 0, right = 1}}
  },
  lualine_z = {
    {"location", separator = {right = ""}, padding = 0},
    {"progress", separator = {right = ""}, padding = 0}
  }
}

require "lualine".setup {
  options = {
    icons_enabled = true,
    theme = theme,
    component_separators = "",
    section_separators = {left = "", right = ""},
    disabled_filetypes = {},
    always_divide_middle = false,
    globalstatus = true
  },
  sections = sections,
  inactive_sections = inactive_different,
  -- inactive_sections = sections,
  tabline = {},
  extensions = {}
}

return M
