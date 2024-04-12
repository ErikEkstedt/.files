local gruvbox = {
  "ellisonleao/gruvbox.nvim",
  -- dependencies = { "rcarriga/nvim-notify" },
  lazy = false,
  priority = 1000,
  config = function()
    require("gruvbox").setup({
      transparent_mode = true,
      dim_inactive = true,
      overrides = {
        NotifyBackground = { link = "GruvboxAqua" },
      },
    })
    vim.cmd([[colorscheme gruvbox]])
    -- require("notify").setup({
    --   background_colour = require("gruvbox").palette.dark0,
    -- })
  end,
}

local kanagawa = {
  "rebelot/kanagawa.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    -- Default options:
    require("kanagawa").setup({
      compile = false, -- enable compiling the colorscheme
      undercurl = true, -- enable undercurls
      commentStyle = { italic = true },
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      transparent = true, -- do not set background color
      dimInactive = true,
      overrides = function(colors)
        return {
          TelescopeBorder = { bg = "none" },
          Folded = { link = "NonText" },
          CursorLine = { bg = colors.theme.ui.bg_sel },
          WinSeparator = { fg = "#999999" },
          DiagnosticError = { fg = "#D55555" },
          DiagnosticSignError = { fg = "#D55555" },
          Pmenu = { bg = "#242430" },
          PmenuSel = { bg = "#46445E" },
          -- update kanagawa to handle new treesitter highlight captures
          ["@string.regexp"] = { link = "@string.regex" },
          ["@variable.parameter"] = { link = "@parameter" },
          ["@exception"] = { link = "@exception" },
          ["@string.special.symbol"] = { link = "@symbol" },
          ["@markup.strong"] = { link = "@text.strong" },
          ["@markup.italic"] = { link = "@text.emphasis" },
          ["@markup.heading"] = { link = "@text.title" },
          ["@markup.raw"] = { link = "@text.literal" },
          ["@markup.quote"] = { link = "@text.quote" },
          ["@markup.math"] = { link = "@text.math" },
          ["@markup.environment"] = { link = "@text.environment" },
          ["@markup.environment.name"] = { link = "@text.environment.name" },
          ["@markup.link.url"] = { link = "Special" },
          ["@markup.link.label"] = { link = "Identifier" },
          ["@comment.note"] = { link = "@text.note" },
          ["@comment.warning"] = { link = "@text.warning" },
          ["@comment.danger"] = { link = "@text.danger" },
          ["@diff.plus"] = { link = "@text.diff.add" },
          ["@diff.minus"] = { link = "@text.diff.delete" },
          -- ZSH
          zshFunction = { link = "Function" },
          zshVariableDef = { link = "Variable" },
        }
      end,
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none",
            },
          },
        },
      },
      theme = "wave", -- Load "wave" theme when 'background' option is not set
    })
    vim.cmd([[colorscheme kanagawa]])
    -- require("lualine").setup({ options = { theme = "kanagawa" } })
  end,
}

-- Material ---------------------------------------------------------------
-- white      = "#EEFFFF",
-- gray       = "#717CB4",
-- black      = "#000000",
-- red        = "#F07178",
-- green      = "#C3E88D",
-- yellow     = "#FFCB6B",
-- blue       = "#82AAFF",
-- paleblue   = "#B0C9FF",
-- cyan       = "#89DDFF",
-- purple     = "#C792EA",
-- orange     = "#F78C6C",
-- pink       = "#FF9CAC",
-- darkred    = "#DC6068",
-- darkgreen  = "#ABCF76",
-- darkyellow = "#E6B455",
-- darkblue   = "#6E98EB",
-- darkcyan   = "#71C6E7",
-- darkpurple = "#B480D6",
-- darkorange = "#E2795B",

-- -- Darker theme style with high contrast
-- colors.editor.line_numbers = "#5C5C5C"
-- colors.syntax.comments     = "#757575"
-- colors.editor.line_numbers = "#424242"
-- colors.syntax.comments     = "#515151"
-- colors.editor.bg        = "#212121"
-- colors.editor.bg_alt    = "#1A1A1A"
-- colors.editor.fg        = "#B0BEC5"
-- colors.editor.fg_dark   = "#8C8B8B"
-- colors.editor.selection = "#404040"
-- colors.editor.contrast  = "#1A1A1A"
-- colors.editor.active    = "#323232"
-- colors.editor.border    = "#343434"
-- colors.editor.highlight = "#3F3F3F"
-- colors.editor.disabled  = "#474747"
-- colors.editor.accent    = "#FF9800"

local material = {
  "marko-cerovac/material.nvim",
  lazy = false,
  priority = 1000,
  keys = {
    {
      "<leader>tc",
      function()
        require("material.functions").find_style()
        vim.notify(vim.g.material_style)
      end,
      { silent = true },
    },
  },
  config = function()
    require("material").setup({
      contrast = {
        terminal = true,
        sidebars = true,
        floating_windows = true,
        non_current_windows = true,
      },
      styles = {
        comments = { italic = true },
        keywords = { bold = true },
        functions = { bold = true },
      },
      plugins = {
        "fidget",
        "gitsigns",
        "harpoon",
        "hop",
        "neo-tree",
        "noice",
        "nvim-cmp",
        "trouble",
        "which-key",
      },
      lualine_style = "default",
      custom_highlights = {
        ["@type.builtin"] = { fg = "#FFCB6B" },
        ["@variable.builtin.python"] = { fg = "#ABCF76", bold = true },
        ["@variable.parameter.python"] = { fg = "#B0C9FF" },
        ["@variable.attribute.python"] = { fg = "#E6B455" },
        ["@variable.tsx"] = { link = "Normal" },
        ["@lsp.type.parameter.javascript"] = { fg = "#71C6E7" },
        ["@tag"] = { fg = "#89DDFF" },
        DiagnosticHint = { fg = "#757575" },
        DiagnosticError = { fg = "#A04B47" },
      },
    })
    vim.g.material_style = "darker"
    vim.cmd([[colorscheme material]])
  end,
}

return {
  -- kanagawa,
  -- gruvbox,
  material,
}
