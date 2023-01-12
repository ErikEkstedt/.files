local function apply_monokai()
  -- require("colorbuddy").colorscheme("custom.one_dark_custom")
  -- require("colorbuddy").colorscheme("colors.one_dark")
  local palette = require("monokai").classic
  require("monokai").setup {
    -- palette = require("monokai").classic,
    palette = {
      name = "monokai",
      base1 = "#272a30",
      base2 = "#222426",
      base3 = "#2E323C",
      base4 = "#333842",
      base5 = "#4d5154",
      base6 = "#9ca0a4",
      base7 = "#b1b1b1",
      border = "#a1b5b1",
      brown = "#504945",
      white = "#ffffff",
      grey = "#8F908A",
      black = "#000000",
      pink = "#f92672",
      green = "#a6e22e",
      aqua = "#66d9ef",
      yellow = "#e6db74",
      orange = "#fd971f",
      purple = "#ae81ff",
      red = "#e95678",
      diff_add = "#3d5213",
      diff_remove = "#4a0f23",
      diff_change = "#27406b",
      diff_text = "#23324d"
    },
    custom_hlgroups = {
      -- TSVariable = {fg = palette.green},
      TSParameter = { fg = palette.green },
      include = { fg = palette.pink, style = "bold" },
      keyword = { fg = palette.pink, style = "bold" },
      type = { fg = palette.aqua, style = "bold" },
      -- TSField = {fg = palette.aqua},
      DiffChange = { bg = "NONE" }
    }
  }
end

local function apply_kanagawa()
  require("kanagawa").setup(
    {
      undercurl = true, -- enable undercurls
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = { bold = true },
      variablebuiltinStyle = { italic = true },
      specialReturn = true, -- special highlight for the return keyword
      specialException = true, -- special highlight for exception handling keywords
      transparent = false, -- do not set background color
      dimInactive = true, -- dim inactive window `:h hl-NormalNC`
      globalStatus = true, -- adjust window separators highlight for laststatus=3
      terminalColors = true, -- define vim.g.terminal_color_{0,17}
      colors = { carpYellow = "#FECC66" },
      overrides = {},
      theme = "default" -- Load "default" theme or the experimental "light" theme
    }
  )
  -- setup must be called before loading
  vim.cmd("colorscheme kanagawa")
end

local function apply_gruvbox()
  vim.o.background = "dark" -- or "light" for light mode
  require("gruvbox").setup(
    {
      overrides = {
        SignColumn = { bg = "NONE" },
        PMenu = { bg = "NONE" },
        DiffAdd = { bg = "NONE" },
        GitSignsChange = { bg = "NONE" },
        GitSignsAdd = { bg = "NONE" },
        GitSignsDelete = { bg = "NONE" },
        DiagnosticSignError = { bg = "NONE" },
        DiagnosticSignWarn = { bg = "NONE" },
        DiagnosticSignInfo = { bg = "NONE" },
        DiagnosticSignHint = { bg = "NONE" },
        Folded = { bg = "NONE" },
        FoldColumns = { bg = "NONE" },
        Type = { fg = "#fabd2f", bold = true }
        -- Typedef = { bold = true }
      }
    }
  )
  vim.cmd([[colorscheme gruvbox]])
end

local function apply_tundra()
  vim.opt.background = "dark"
  vim.cmd("colorscheme tundra")
end

local function apply_material()
  -- https://github.com/marko-cerovac/material.nvim
  vim.g.material_style = "darker"
  require("material").setup {
    custom_highlights = {
      GitSignsAdd = { fg = "#c3e88d" },
      DiffDelete = { fg = "#f07178" },
      Normal = { fg = "#C6D6DE", bg = "#212121" }
    }
  }
  vim.cmd "colorscheme material"
end

-- apply_gruvbox()
-- apply_kanagawa()
-- apply_monokai()
apply_material()
