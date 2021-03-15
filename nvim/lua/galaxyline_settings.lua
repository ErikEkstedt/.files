-- GalaxyLine
-- https://github.com/glepnir/galaxyline.nvim
local buffer = require('galaxyline.provider_buffer')
local fileinfo = require('galaxyline.provider_fileinfo')
local gl = require('galaxyline')
local gls = gl.section
local vcs = require('galaxyline.provider_vcs')

-- local extension = require('galaxyline.provider_extensions')

-- COLOR
local colors = {
    bg = '#282c34',
    line_bg = '#353644',
    fg = '#8FBCBB',
    fg_green = '#65a380',
    yellow = '#fabd2f',
    cyan = '#008080',
    darkblue = '#081633',
    green = '#afd700',
    orange = '#FF8800',
    purple = '#5d4d7a',
    magenta = '#c678dd',
    blue = '#51afef';
    red = '#ec5f67'
}

-- FUNCTIONS
local function buffer_not_empty()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true
  end
  return false
end

local function lsp_status(status)
    shorter_stat = ''
    for match in string.gmatch(status, "[^%s]+")  do
        err_warn = string.find(match, "^[WE]%d+", 0)
        if not err_warn then
            shorter_stat = shorter_stat .. ' ' .. match
        end
    end
    return shorter_stat
end

local function get_coc_lsp()
  local status = vim.fn['coc#status']()
  if not status or status == '' then
      return ''
  end
  return lsp_status(status)
end

local function get_diagnostic_info()
  if vim.fn.exists('*coc#rpc#start_server') == 1 then
    return get_coc_lsp()
    end
  return ''
end

local function set_mode_color()
  -- auto change color according the vim mode
  local alias = {
    n      = 'NORMAL',
    i      = 'INSERT',
    c      = 'COMMAND',
    V      = 'VISUAL',
    [''] = 'V-BLOCK',
    v      = 'VISUAL',
    ['r?'] = ':CONFIRM',
    rm     = '--MORE',
    R      = 'REPLACE',
    Rv     = 'VIRTUAL',
    s      = 'SELECT',
    S      = 'SELECT',
    ['r']  = 'HIT-ENTER',
    [''] = 'SELECT',
    t      = 'TERMINAL',
    ['!']  = 'SHELL',
  }
  local mode_color = {
    n      = {colors.bg, colors.green},
    i      = {colors.bg, colors.blue},
    v      = {colors.bg, colors.yellow},
    V      = {colors.bg, colors.yellow},
    [''] = {colors.bg, colors.yellow},
    c      = {colors.bg, colors.orange},
    no     = {colors.magenta, colors.bg},
    s      = {colors.orange, colors.bg},
    S      = {colors.orange, colors.bg},
    R      = {colors.bg, colors.red},
    Rv     = {colors.magenta, colors.bg},
  }
  local vim_mode = vim.fn.mode()
  -- return '  ' .. alias[vim_mode] .. ' '
  if alias[vim_mode] ~= nil then
    vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim_mode][1])
    vim.api.nvim_command('hi GalaxyViMode guibg='..mode_color[vim_mode][2])
    return '  ' .. alias[vim.fn.mode()] .. ' '
  else
    return '  Unknown '
  end
end

-- BETTER VARIABLE/FUNCTION NAMES
-- provider 
BufferIcon   = buffer.get_buffer_type_icon
BufferNumber = buffer.get_buffer_number
FileTypeName = buffer.get_buffer_filetype

-- Git Provider
GitBranch    = vcs.get_git_branch
DiffAdd      = vcs.diff_add             -- support vim-gitgutter vim-signify gitsign
DiffModified = vcs.diff_modified   -- support vim-gitgutter vim-signify gitsign
DiffRemove   = vcs.diff_remove       -- support vim-gitgutter vim-signify gitsign

-- File Provider
LineColumn   = fileinfo.line_column
FileFormat   = fileinfo.get_file_format
FileEncode   = fileinfo.get_file_encode
FileSize     = fileinfo.get_file_size
FileIcon     = fileinfo.get_file_icon
FileName     = fileinfo.get_current_file_name
LinePercent  = fileinfo.current_line_percent


-- STATUSLINE ELEMENTS
local left_index = 1
gls.left[left_index] = {
  ViMode = {
    provider = set_mode_color,
    highlight = {colors.red,colors.line_bg,'bold'},
  },
}
left_index = left_index + 1

gls.left[left_index] = {
  GitBranch = {
    provider = GitBranch,
    condition = vcs.check_git_workspace,
    icon = '  \xee\x82\xa0',
    highlight = {colors.orange,colors.line_bg},
  }
}
left_index = left_index + 1

gls.left[left_index] = {
  FileName = {
    provider = FileName,
    condition = buffer_not_empty,
    highlight = {colors.cyan,colors.line_bg},
  }
}
left_index = left_index + 1


gls.left[left_index] = {
  DiagnosticWarn = {
    provider = get_diagnostic_info, 
    icon = '  ',
    highlight = {colors.yellow,colors.bg},
  }
}
left_index = left_index + 1
