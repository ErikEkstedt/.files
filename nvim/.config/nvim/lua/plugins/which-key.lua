return {
  "folke/which-key.nvim",
  config = function()
    local wk = require("which-key")

    -- Telescope
    wk.register(
      {
        f = {
          name = "Fuzzy",
          b = "Buffers",
          c = {
            c = "DotFiles",
            o = "Commands"
          },
          f = "files",
          g = "Git",
          h = {
            e = "Help",
            i = "Highlights"
          },
          v = "PluginsInstallation",
          l = "BufferLines",
          n = "Notes",
          w = "Grep",
          x = "Notify",
          z = "Notes"
        },
        m = {a = "Mappings"}
      },
      {prefix = "<leader>"}
    )

    -- Leader
    -- Misc
    wk.register(
      {
        g = {
          g = "LazyGit"
        },
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
        h = "HopLeft",
        l = "HopRight",
        j = "HopDown",
        k = "HopUp",
        ["<space>"] = "BufferLast"
      },
      {prefix = "<leader>"}
    )

    -- Diagnostics
    wk.register(
      {
        d = {
          name = "Diagnostics",
          d = "DiagnosticShowLineDiagnostics",
          q = "DiagnosticSetLocList",
          j = "DiagnositcDown",
          k = "DiagnositcUp"
        },
        r = {n = "LSPRename"},
        s = {o = "LSPSymbols"},
        w = {l = "LSPInspectWorkspace"}
      },
      {prefix = "<leader>"}
    )
    -- LSP
    wk.register(
      {
        c = {a = "CodeAction"},
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
