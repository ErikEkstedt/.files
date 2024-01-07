-- TODO: This file should probably be renamed to telescope.lua
return {
  {
    "telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
    },
    keys = {
      { "<leader><leader>", false },
      {
        "<leader>FF", -- TEMPROREAY
        function()
          require("telescope.builtin").find_files({
            cwd = "$HOME/files_old",
            hidden = true,
          })
        end,
        desc = "Find Plugin File",
      },
      {
        "<leader>fw",
        require("telescope.builtin").live_grep,
      },
      {
        "<leader>fk",
        function()
          require("telescope.builtin").keymaps()
        end,
        desc = "Find Plugin File",
      },
      {
        "<leader>fP",
        function()
          require("telescope.builtin").find_files({
            prompt_title = "< Lazy + Plugin >",
            cwd = require("lazy.core.config").options.root,
          })
        end,
        desc = "Find Plugin File",
      },
      {
        "<leader>fc",
        function()
          require("telescope.builtin").find_files({
            prompt_title = "< dotFiles >",
            cwd = "$HOME/.files",
            hidden = true,
          })
        end,
        desc = "Find dotFiles File",
      },
      {
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({
            cwd = "$HOME/projects",
          })
        end,
        desc = "Find Plugin File",
      },
      {
        "<leader>fhe",
        function()
          require("telescope.builtin").help_tags()
        end,
        desc = "Lists available help tags and opens a new window with the relevant help info on <cr>",
      },
      {
        "<leader>fhi",
        function()
          local builtin = require("telescope.builtin")
          builtin.highlights()
        end,
      },
      {
        "<leader>fma",
        function()
          local builtin = require("telescope.builtin")
          builtin.man_pages()
        end,
      },
      {
        "<leader>fw",
        function()
          local builtin = require("telescope.builtin")
          builtin.live_grep()
        end,
        desc = "Search for a string in your current working directory and get results live as you type, respects .gitignore",
      },
    },
    opts = {
      defaults = {
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = {
            prompt_position = "top",
          },
        },
        mappings = {
          i = {
            ["<c-l>"] = require("telescope.actions").select_vertical,
            ["<c-j>"] = require("telescope.actions").select_horizontal,
          },
          n = {
            ["<c-l>"] = require("telescope.actions").select_vertical,
            ["<c-j>"] = require("telescope.actions").select_horizontal,
          },
        },
      },
    },
  },
}
