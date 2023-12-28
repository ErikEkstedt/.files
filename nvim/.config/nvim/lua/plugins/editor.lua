local Util = require("lazyvim.util")

local function search_root()
  require("telescope.builtin").find_files({
    cwd = require("lazy.core.config").options.root,
  })
end

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
            cwd = require("lazy.core.config").options.root,
          })
        end,
        desc = "Find Plugin File",
      },
      {
        "<leader>fc",
        function()
          require("telescope.builtin").find_files({
            cwd = "$HOME/.files",
            hidden = true,
          })
        end,
        desc = "Find Plugin File",
      },
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
          local builtin = require("telescope.builtin")
          builtin.help_tags()
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
        "<leader>fw",
        function()
          local builtin = require("telescope.builtin")
          builtin.live_grep()
        end,
        desc = "Search for a string in your current working directory and get results live as you type, respects .gitignore",
      },
    },
    opts = function()
      local actions = require("telescope.actions")

      local open_with_trouble = function(...)
        return require("trouble.providers.telescope").open_with_trouble(...)
      end
      local open_selected_with_trouble = function(...)
        return require("trouble.providers.telescope").open_selected_with_trouble(...)
      end
      local find_files_no_ignore = function()
        local action_state = require("telescope.actions.state")
        local line = action_state.get_current_line()
        Util.telescope("find_files", { no_ignore = true, default_text = line })()
      end
      local find_files_with_hidden = function()
        local action_state = require("telescope.actions.state")
        local line = action_state.get_current_line()
        Util.telescope("find_files", { hidden = true, default_text = line })()
      end

      return {
        defaults = {
          prompt_prefix = " ",
          color_devicons = true,
          selection_caret = " ",
          -- open files in the first window that is an actual file.
          -- use the current window if no other window is available.
          get_selection_window = function()
            local wins = vim.api.nvim_list_wins()
            table.insert(wins, 1, vim.api.nvim_get_current_win())
            for _, win in ipairs(wins) do
              local buf = vim.api.nvim_win_get_buf(win)
              if vim.bo[buf].buftype == "" then
                return win
              end
            end
            return 0
          end,
          sorting_strategy = "ascending",
          layout_config = {
            horizontal = {
              prompt_position = "top",
            },
          },
          mappings = {
            n = {
              ["q"] = actions.close,
              ["<c-l>"] = actions.select_vertical,
              ["<c-j>"] = actions.select_horizontal,
              ["<C-q>"] = actions.close,
              ["<cr>"] = actions.select_default,
            },
            i = {
              ["<c-l>"] = actions.select_vertical,
              ["<c-j>"] = actions.select_horizontal,
              ["<c-t>"] = open_with_trouble,
              ["<a-t>"] = open_selected_with_trouble,
              ["<a-i>"] = find_files_no_ignore,
              ["<a-h>"] = find_files_with_hidden,
              ["<C-Down>"] = actions.cycle_history_next,
              ["<C-Up>"] = actions.cycle_history_prev,
              ["<C-f>"] = actions.preview_scrolling_down,
              ["<C-b>"] = actions.preview_scrolling_up,
            },
          },
        },
      }
    end,
  },
}
