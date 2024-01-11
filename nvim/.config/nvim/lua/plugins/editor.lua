-- telescope-config.lua

-- We cache the results of "git rev-parse"
-- Process creation is expensive in Windows, so this reduces latency
local is_inside_work_tree = {}

local function project_files()
  local opts = {} -- define here if you want to define something
  local cwd = vim.fn.getcwd()
  if is_inside_work_tree[cwd] == nil then
    vim.fn.system("git rev-parse --is-inside-work-tree")
    is_inside_work_tree[cwd] = vim.v.shell_error == 0
  end

  if is_inside_work_tree[cwd] then
    require('telescope.builtin').git_files(opts)
  else
    require('telescope.builtin').builtin.find_files(opts)
  end
end

return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
    },
    cmd = "Telescope",
    version = false, -- telescope did only one rele
    keys = {
      {
        "<leader>ff",
        function()
          project_files()
        end,
        desc = "Search Files ",
      },
      {
        "<leader>fF",
        function()
          require("telescope.builtin").find_files()
        end,
        desc = "Search Files ",
      },
      {
        "<leader>fhe",
        function()
          require("telescope.builtin").help_tags()
        end,
        desc = "Search Help ",
      },
      {
        "<leader>fhi",
        function()
          require("telescope.builtin").highlights()
        end,
        desc = "Search Highlight",
      },
      {
        "<leader>fc",
        function()
          require("telescope.builtin").find_files({cwd='$HOME/.files', hidden=true})
        end,
        desc = "Search DotFiles ",
      },
      {
        "<leader>fw",
        function()
          require("telescope.builtin").live_grep()
        end,
        desc = "Grep",
      },
      {
        "<leader>fk",
        function()
          require("telescope.builtin").keymaps()
        end,
        desc = "Mappings",
      },
    },
    config = function()
      local actions = require("telescope.actions")
      -- Disable folding in Telescope's result window.
      vim.api.nvim_create_autocmd("FileType", { pattern = "TelescopeResults", command = [[setlocal nofoldenable]] })

      require("telescope").setup({
        defaults = {
          sorting_strategy = "ascending",
          layout_config = {
            horizontal = { prompt_position = "top" },
          },
          mappings = {
            i = {
              ["<c-x>"] = false,
              ["<c-v>"] = false,
              ["<c-l>"] = actions.select_vertical,
              ["<c-j>"] = actions.select_horizontal,
              ["<C-q>"] = actions.send_to_qflist,
              ["<cr>"] = actions.select_default,
            },
            n = {
              ["q"] = actions.close,
              ["<c-x>"] = false,
              ["<c-v>"] = false,
              ["<c-l>"] = actions.select_vertical,
              ["<c-j>"] = actions.select_horizontal,
              ["<C-q>"] = actions.close,
              ["<cr>"] = actions.select_default,
            },
          },
        },
      })
    end,
  },
}
