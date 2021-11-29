local colors = {
  green = "#95E454",
  blue = "#61afef",
  black = "#050505",
  magenta = "#E80FE7",
  red = "#e06c75",
  orange = "#DCB917",
  bg = "#404145",
  bg2 = "#2C2F33",
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
    a = {fg = colors.bg, bg = colors.orange, gui = "bold"},
    x = {fg = colors.orange, bg = colors.bg, gui = "bold"},
    y = {fg = colors.orange, bg = colors.bg, gui = "bold"},
    z = {fg = colors.orange, bg = colors.bg, gui = "bold"}
  },
  replace = {
    a = {fg = colors.bg, bg = colors.red, gui = "bold"},
    x = {fg = colors.red, bg = colors.bg, gui = "bold"},
    y = {fg = colors.red, bg = colors.bg, gui = "bold"},
    z = {fg = colors.red, bg = colors.bg, gui = "bold"}
  },
  inactive = {
    a = {fg = colors.color4, bg = colors.bg2},
    b = {fg = colors.color4, bg = colors.bg2},
    c = {fg = colors.color4, bg = colors.bg2},
    z = {fg = colors.color4, bg = colors.bg2}
  },
  normal = {
    a = {fg = colors.black, bg = colors.blue, gui = "bold"},
    b = {fg = colors.magenta, bg = colors.bg},
    c = {fg = colors.blue, bg = colors.bg2},
    x = {fg = colors.blue, bg = colors.bg, gui = "bold"},
    y = {fg = colors.blue, bg = colors.bg, gui = "bold"},
    z = {fg = colors.blue, bg = colors.bg, gui = "bold"}
  },
  insert = {
    a = {fg = colors.color2, bg = colors.green, gui = "bold"},
    x = {fg = colors.green, bg = colors.bg, gui = "bold"},
    y = {fg = colors.green, bg = colors.bg, gui = "bold"},
    z = {fg = colors.green, bg = colors.bg, gui = "bold"}
  }
}

require "lualine".setup {
  options = {
    icons_enabled = true,
    theme = theme,
    -- component_separators = {left = "", right = ""},
    -- section_separators = {left = "", right = ""},
    -- component_separators = {left = "|", right = "--"},
    -- section_separators = {left = "█", right = "--"},
    component_separators = "|",
    section_separators = {left = "", right = ""},
    disabled_filetypes = {},
    always_divide_middle = true
  },
  sections = {
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
        path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
        shorting_target = 40 -- Shortens path to leave 40 space in the window
        -- for other components. Terrible name any suggestions?
      }
    },
    lualine_x = {
      {
        "diagnostics",
        separator = {left = ""},
        left_padding = 2,
        sources = {"nvim_lsp"}
      }
    },
    lualine_y = {
      {"filetype", separator = {left = ""}, padding = {left = 0, right = 1}}
    },
    lualine_z = {
      {"location", separator = {right = ""}, padding = 0},
      {"progress", separator = {right = ""}, padding = 0}
    }
  },
  inactive_sections = {
    lualine_a = {
      {
        function()
          return " "
        end,
        separator = {left = ""},
        padding = {right = 0, left = 0}
      }
    },
    lualine_b = {
      {
        "filename",
        path = 2,
        fmt = function(str)
          -- local width = vim.fn.winwidth(0)
          -- local fill = width - #str
          -- local horizontal_sep = "—"
          -- fill = vim.fn.float2nr(fill / 2) - 10
          -- print("fill: " .. fill .. " w: " .. width)
          -- local pad = string.rep(horizontal_sep, fill)
          -- local ret = "↑" .. pad .. str .. pad .. "↑"
          -- local ret = pad .. "↑ " .. str .. " ↑" .. pad
          local ret = "↑ " .. str .. " ↑"
          return ret
          -- return ""
        end,
        shortening_target = 40
      }
    },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {
      {
        function()
          return " "
        end,
        separator = {right = ""},
        padding = {right = 0, left = 0}
      }
    }
  },
  tabline = {},
  extensions = {}
}
