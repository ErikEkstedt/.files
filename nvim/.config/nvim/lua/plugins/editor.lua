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
    require("telescope.builtin").git_files(opts)
  else
    require("telescope.builtin").find_files(opts)
  end
end

return {
  { "mbbill/undotree" },
  { "wellle/targets.vim" },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "tsakirist/telescope-lazy.nvim" },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
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
        "<leader>fb",
        function()
          require("telescope.builtin").buffers()
        end,
        desc = "Search Files ",
      },
      {
        "<leader>FF",
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
          require("telescope.builtin").find_files({ cwd = "$HOME/.files", hidden = true })
        end,
        desc = "Search DotFiles ",
      },
      {
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({ cwd = "$HOME/projects", hidden = true })
        end,
        desc = "Search ProjectFiles ",
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
        extensions = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      })

      -- Extensions
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("lazy")
    end,
  },
  {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim", "rcarriga/nvim-notify" },
    keys = {
      {
        "<leader>hh",
        function()
          require("harpoon.ui").toggle_quick_menu()
        end,
        desc = "Harpoon Toggle UI",
      },
      {
        "<leader>ha",
        function()
          require("harpoon.mark").add_file()
          -- get the filename for the current buffer
          local filename = vim.fn.expand("%:p")
          vim.notify("Harpoon: " .. filename, vim.log.levels.INFO)
        end,
        desc = "Harpoon add file",
      },
      {
        "<leader>1",
        function()
          require("harpoon.ui").nav_file(1)
        end,
        desc = "Harpoon goto 1",
      },
      {
        "<leader>2",
        function()
          require("harpoon.ui").nav_file(2)
        end,
        desc = "Harpoon goto 2",
      },
      {
        "<leader>3",
        function()
          require("harpoon.ui").nav_file(3)
        end,
        desc = "Harpoon goto 3",
      },
      {
        "<leader>hn",
        function()
          require("harpoon.ui").nav_next()
        end,
        desc = "Harpoon goto next",
      },
      {
        "<leader>hp",
        function()
          require("harpoon.ui").nav_prev()
        end,
        desc = "Harpoon goto prev",
      },
    },
    config = function()
      require("harpoon").setup()
    end,
  },
  {
    "phaazon/hop.nvim",
    branch = "v2", -- optional but strongly recommended
    config = function()
      local hop = require("hop")
      local HintDirection = require("hop.hint").HintDirection
      vim.keymap.set("n", "<space>j", function()
        hop.hint_lines_skip_whitespace({ direction = HintDirection.AFTER_CURSOR })
      end, {})
      vim.keymap.set("n", "<space>k", function()
        hop.hint_lines_skip_whitespace({ direction = HintDirection.BEFORE_CURSOR })
      end, {})
      vim.keymap.set("n", "<space>h", function()
        hop.hint_words({ direction = HintDirection.BEFORE_CURSOR })
      end, {})
      vim.keymap.set("n", "<space>l", function()
        hop.hint_words({ direction = HintDirection.AFTER_CURSOR })
      end, {})

      require("hop").setup({})
    end,
  },
}
