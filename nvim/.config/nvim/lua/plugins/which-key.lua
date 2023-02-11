return {
  "folke/which-key.nvim",
  config = function()
    local wk = require("which-key")

    -- Telescope
    wk.register(
      {
        c = {
          o = "Commands"
        },
        f = {
          name = "Fuzzy",
          b = "Buffers",
          c = "DotFiles",
          f = "files",
          g = "Git",
          v = "PluginsInstallation",
          l = "BufferLines",
          n = "Notes",
          w = "Grep",
          x = "Notify",
          z = "Notes"
        },
        h = {
          e = "Help",
          i = "Highlights"
        },
        m = {a = "Mappings"}
      },
      {prefix = "<leader>"}
    )

    -- Leader
    -- Misc
    wk.register(
      {
        g = "LazyGit",
        t = "NvimTree",
        u = "LFPopUp"
      },
      {prefix = "<leader>"}
    )
    -- Movement
    wk.register(
      {
        b = "BufferPrev",
        B = "BufferFirst",
        n = "BufferNext",
        N = "BufferEnd",
        ["<space>"] = "BufferLast"
      },
      {prefix = "<leader>"}
    )

    -- LSP
    wk.register(
      {
        c = {a = "CodeAction"},
        e = "DiagnosticShowLine",
        q = "DiagnosticSetLocList",
        r = {n = "LSPRename"},
        s = {o = "LSPSymbols"},
        w = {l = "LSPInspectWorkspace"}
      },
      {prefix = "<leader>"}
    )
    wk.register(
      {
        g = {
          D = "LSPDeclaration",
          d = "LSPDefinition",
          i = "LSPImplementation",
          j = "DiagnositcDown",
          k = "DiagnositcUp",
          r = "LSPReferences"
        },
        K = "LSPHover"
      }
    )

    wk.setup {
      window = {
        border = "single", -- none, single, double, shadow
        position = "top", -- bottom, top
        margin = {30, 10, 30, 10}, -- extra window margin [top, right, bottom, left]
        padding = {0, 0, 0, 0}, -- extra window padding [top, right, bottom, left]
        winblend = 0
      },
      layout = {
        height = {min = 4, max = 25}, -- min and max height of the columns
        width = {min = 20, max = 50}, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "left" -- align columns left, center or right
      },
      triggers_blacklist = {
        i = {","}
      }
    }
  end
}
