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
    keys = {
      { "<space>fno", "<cmd>:ObsidianSearch<CR>" },
      { "<space>fnn", "<cmd>:ObsidianNew<CR>" },
      { "<space>fnd", "<cmd>:ObsidianToday<CR>" },
      { "<space>oo", "<cmd>:ObsidianOpen<CR>" },
    },
    opts = {
      workspaces = {
        {
          name = "Notes",
          path = NOTE_ROOT,
        },
      },
      daily_notes = {
        -- Optional, if you keep daily notes in a separate directory.
        folder = NOTE_ROOT .. "/daily",
        -- Optional, if you want to change the date format for the ID of daily notes.
        date_format = "%Y-%m-%d",
        -- Optional, if you want to change the date format of the default alias of daily notes.
        alias_format = "%B %-d, %Y",
        -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
        template = nil,
      },
    },
    config = function(opts)
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "markdown", "md" },
        callback = function()
          vim.wo.conceallevel = 2
        end,
      })
      require("obsidian").setup(opts.opts)
    end,
  },
}
