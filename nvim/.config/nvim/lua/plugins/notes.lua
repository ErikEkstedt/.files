local NOTE_ROOT = vim.fn.expand("~/Notes/Notes")

return {
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim", -- Required.
      "hrsh7th/nvim-cmp",
      "nvim-telescope/telescope.nvim",
    },
    cmd = {
      "ObsidianSearch",
      "ObsidianNew",
      "ObsidianToday",
      "ObsidianOpen",
      "ObsidianFollowLink",
    },
    keys = {
      { "<space>fno", "<cmd>:ObsidianSearch<CR>", desc = "Notes Search" },
      { "<space>fnn", "<cmd>:ObsidianNew<CR>", desc = "Notes New" },
      { "<space>fnd", "<cmd>:ObsidianToday<CR>", desc = "Notes Today" },
      { "<space>oo", "<cmd>:ObsidianOpen<CR>", desc = "Open Obsidian" },
      {
        "gf",
        function()
          if require("obsidian").util.cursor_on_markdown_link() then
            return "<cmd>ObsidianFollowLink<CR>"
          else
            return "gf"
          end
        end,
        desc = "goto file (obsidian passthrough)",
        expr = true,
      },
    },
    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "markdown", "md" },
        callback = function()
          vim.wo.conceallevel = 2
        end,
      })
      require("obsidian").setup({
        workspaces = {
          {
            name = "Notes",
            path = NOTE_ROOT,
          },
        },
        daily_notes = {
          -- Optional, if you keep daily notes in a separate directory.
          folder = "/daily",
          -- Optional, if you want to change the date format for the ID of daily notes.
          date_format = "%Y-%m-%d",
          -- Optional, if you want to change the date format of the default alias of daily notes.
          alias_format = "%B %-d, %Y",
          -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
          template = nil,
        },
      })
    end,
  },
}
