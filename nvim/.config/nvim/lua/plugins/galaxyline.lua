local gl = require('galaxyline')
local gls = gl.section
local condition = require "galaxyline.condition"
gl.short_line_list = {'NvimTree','vista','dbui', 'packer'}


local colors = {
  bg = "#383c44",
  fg_1 = "#abb2bf",
  fg_2 = "#828997",
  fg_3 = "#5c6370",
  fg_4 = "#4b5263",
  bgInactive = "#242a30",
  separator_fg = "#242a30",
  yellow = '#fabd2f',
  cyan = '#00FFFF',
  darkblue = '#081633',
  green = "#98c379",
  orange = "#d19a66",
  purple = '#7E00FD',
  magenta = "#c678dd",
  pink = '#FF00C4',
  grey = '#c0c0c0',
  blue = "#61afef",
  red = '#ec5f67',
}

vim.cmd("hi StatusLine guibg=" .. colors.bgInactive)
vim.cmd("hi StatusLineNC guibg=" .. colors.bgInactive)

local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true
  end
  return false
end

local mode_color = {
  n = colors.blue,
  i = colors.green,
  v = colors.yellow,
  [""] = colors.yellow,
  V = colors.yellow,
  c = colors.magenta,
  no = colors.blue,
  s = colors.orange,
  S = colors.orange,
  [""] = colors.orange,
  ic = colors.yellow,
  R = colors.red,
  Rv = colors.red,
  cv = colors.blue,
  ce = colors.blue,
  r = colors.cyan,
  rm = colors.cyan,
  ["r?"] = colors.cyan,
  ["!"] = colors.blue,
  t = colors.blue,
}

local alias = {
  n= 'NORMAL',
  i= 'INSERT',
  c= 'COMMAND',
  v= 'VISUAL',
  V= 'VISUAL',
  R= 'Replace',
  t= 'Term',
  [''] = 'V-BLOCK'
}


table.insert(gls.left, {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      vim.api.nvim_command("hi GalaxyViMode guibg=" .. mode_color[vim.fn.mode()])
      local tmp_alias = alias[vim.fn.mode()]
      if tmp_alias == nil then
        tmp_alias = vim.fn.mode()
      end
      local ret = "  " .. tmp_alias .. " "
      if string.len(ret) < 10 then
        ret = ret .. ' '
      end
      return ret
    end,
    separator = " ",
    separator_highlight = { "NONE", colors.bg },
    highlight = { colors.bg, colors.bg },
  },
})

table.insert(gls.left, {
  FileIcon = {
    provider = 'FileIcon',
    condition = buffer_not_empty,
    highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.bg},
  },
})

table.insert(gls.left, {
  FileName = {
    provider = {'FileName'},
    condition = buffer_not_empty,
    highlight = {colors.magenta,colors.bg}
  }
})

table.insert(gls.left, {
  GitIcon = {
    provider = function()
      return '   '
    end,
    condition = condition.check_git_workspace,
    separator = "",
    separator_highlight = { "NONE", colors.bg },
    highlight = { colors.orange, colors.bg },
  },
})

table.insert(gls.left, {
  GitBranch = {
    provider = "GitBranch",
    condition = condition.check_git_workspace,
    separator = " ",
    separator_highlight = { "NONE", colors.bg },
    highlight = { colors.orange, colors.bg },
  },
})

table.insert(gls.left, {
  DiffAdd = {
    provider = "DiffAdd",
    condition = condition.hide_in_width,
    icon = "  ",
    highlight = { colors.green, colors.bg },
  },
})

table.insert(gls.left, {
  DiffModified = {
    provider = "DiffModified",
    condition = condition.hide_in_width,
    icon = " 柳",
    highlight = { colors.blue, colors.bg },
  },
})

table.insert(gls.left, {
  DiffRemove = {
    provider = "DiffRemove",
    condition = condition.hide_in_width,
    icon = "  ",
    highlight = { colors.red, colors.bg },
  },
})

table.insert(gls.left, {
  Filler = {
    provider = function()
      return " "
    end,
    highlight = { colors.grey, colors.bg },
  },
})

---------------------------------------------------------------------
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
        if not string.find(lsps, client.name) then
          lsps = lsps .. ", " .. client.name
        end
        -- print("more", lsps)
      end
    end
  end
  if lsps == "" then
    return msg
  else
    return lsps
  end
end

table.insert(gls.right, {
  ShowLspClient = {
    provider = get_lsp_client,
    condition = function()
      local tbl = { ["dashboard"] = true, [" "] = true }
      if tbl[vim.bo.filetype] then
        return false
      end
      return true
    end,
    icon = " ",
    highlight = { colors.cyan, colors.bg },
  },
})

table.insert(gls.left, {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {colors.red,colors.bg}
  }
})

table.insert(gls.left, {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = {colors.orange,colors.bg},
  }
})

---------------------------------------------------------------------
-- Python Environment

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
local PythonEnv = function()
  if vim.bo.filetype == "python" then
    local venv = os.getenv "CONDA_DEFAULT_ENV"
    if venv ~= nil then
      return "   (" .. env_cleanup(venv) .. ")"
    end
    venv = os.getenv "VIRTUAL_ENV"
    if venv ~= nil then
      return "   (" .. env_cleanup(venv) .. ")"
    end
    return ""
  end
  return ""
end

table.insert(gls.right, {
  VirtualEnv = {
    provider = PythonEnv,
    event = "BufEnter",
    highlight = { colors.green, colors.bg },
  },
})

---------------------------------------------------------------------
-- File/Buffer Information
table.insert(gls.right, {
  LineInfo = {
    provider = "LineColumn",
    separator = " |",
    separator_highlight = { colors.separator_fg, colors.bg },
    highlight = { colors.grey, colors.bg },
  },
})

table.insert(gls.right, {
  Tabstop = {
    provider = function()
      return "Spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth") .. " "
    end,
    condition = condition.hide_in_width,
    separator = "|",
    separator_highlight = { colors.separator_fg, colors.bg },
    highlight = { colors.grey, colors.bg },
  },
})

table.insert(gls.right, {
  BufferType = {
    provider = "FileTypeName",
    condition = condition.hide_in_width,
    separator = "|",
    separator_highlight = { colors.separator_fg, colors.bg },
    highlight = { colors.grey, colors.bg },
  },
})

table.insert(gls.right, {
  ScrollBar = {
    provider = "ScrollBar",
    highlight = { colors.green, colors.bg },
    separator = " |",
    separator_highlight = { colors.separator_fg, colors.bg },
  },
})


---------------------------------------------------------------------
-- Short
table.insert(gls.short_line_left, {
  SFileName = {
    provider = "FileName",
    condition = condition.buffer_not_empty,
    highlight = { colors.blue, colors.bgInactive },
  },
})

-- table.insert(gls.short_line_right, {
--   Space = {
--     provider = "SFileName",
--     condition = condition.buffer_not_empty,
--     highlight = { colors.blue, colors.alt_bg },
--   },
-- })
