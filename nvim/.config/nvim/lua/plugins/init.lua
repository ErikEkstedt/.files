-- Install packer if not yet installed
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
  vim.cmd [[packadd packer.nvim]]
  print("Bootstrapped Packer...")
end

vim.cmd(
  [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins/init.lua source <afile> | PackerCompile
  augroup end
]]
)

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
return require("packer").startup(
  {
    function(use)
      -- Packer can manage itself
      use "wbthomason/packer.nvim"

      -- Standard in many lua plugins. Contains functions you don't want to implement again...
      use "nvim-lua/plenary.nvim"
      use { "nvim-lua/popup.nvim", requires = "nvim-lua/plenary.nvim" }
      use {
        "rcarriga/nvim-notify",
        config = function()
          require("plugins.notify")
        end
      }

      -- LSP, Treesitter, Snippets
      use "neovim/nvim-lspconfig"
      use "williamboman/mason.nvim"
      use({ "weilbith/nvim-code-action-menu", cmd = "CodeActionMenu" })
      use {
        "williamboman/mason-lspconfig.nvim",
        requires = {
          "ray-x/lsp_signature.nvim",
          "kosayoda/nvim-lightbulb"
        },
        config = function()
          require("diagnostic")
          require("lsp")
        end
      }

      -- Autocomplete
      use {
        "hrsh7th/nvim-cmp",
        requires = {
          "hrsh7th/cmp-nvim-lsp",
          "hrsh7th/cmp-nvim-lua",
          "hrsh7th/cmp-buffer",
          "hrsh7th/cmp-path",
          "hrsh7th/cmp-cmdline",
          "saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
          "L3MON4D3/LuaSnip", -- Snippet engine
          "rafamadriz/friendly-snippets", --snippet collections
          "onsails/lspkind-nvim" -- Pretty symbols for lsp
        },
        config = function()
          require("plugins.nvim-cmp")
          require("plugins.luasnip")
        end
      }

      -- Treesitter
      -- Mostly used for syntax, tshighlightundercursor
      use {
        "nvim-treesitter/nvim-treesitter",
        requires = {
          "nvim-treesitter/playground",
          -- "nvim-treesitter/nvim-treesitter-context",
          "nvim-treesitter/nvim-treesitter-textobjects"
        },
        config = function()
          require("plugins.treesitter")
        end,
        run = ":TSUpdate"
      }
      use "JoosepAlviste/nvim-ts-context-commentstring"

      -- Fuzzy Finding
      use {
        "nvim-telescope/telescope.nvim",
        requires = {
          "nvim-lua/plenary.nvim",
          "nvim-telescope/telescope-fzf-native.nvim",
          "dhruvmanila/telescope-bookmarks.nvim"
        },
        config = function()
          require("plugins.telescope")
        end
      }
      use { "mbbill/undotree" }

      use {
        "sudormrfbin/cheatsheet.nvim",
        -- optional
        requires = {
          { "nvim-telescope/telescope.nvim" },
          { "nvim-lua/popup.nvim" },
          { "nvim-lua/plenary.nvim" }
        }
      }
      use "junegunn/fzf.vim" -- NON-LUA
      use {
        "junegunn/fzf",
        run = function()
          vim.fn["fzf#install"]()
        end
      } -- NON-LUA

      -- Mini: https://github.com/echasnovski/mini.nvim
      use {
        "echasnovski/mini.nvim",
        config = function()
          -- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-align.md
          require("mini.align").setup({ mappings = { start = "<space>a" } })
          require("mini.trailspace").setup()
          -- require("mini.pairs").setup()
          -- require("mini.surround").setup()
        end
      }
      use(
        {
          "kylechui/nvim-surround",
          tag = "*", -- Use for stability; omit to use `main` branch for the latest features
          config = function()
            require("nvim-surround").setup({})
          end
        }
      )
      use {
        "windwp/nvim-autopairs",
        config = function()
          require("nvim-autopairs").setup {}
        end
      }

      use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
          require("todo-comments").setup {}
          vim.api.nvim_set_keymap("n", "<leader>ft", ":TodoTelescope<cr>", { noremap = true, silent = true })
        end
      }
      use {
        "folke/which-key.nvim",
        config = function()
          require("plugins.which_key")
        end
      }
      use {
        "numToStr/Comment.nvim",
        config = function()
          require("plugins.comment")
        end
      }
      use "tpope/vim-repeat" -- NON-LUA

      -- StatusLine / Bufferline
      use {
        "akinsho/nvim-bufferline.lua",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
          require("plugins.nvim-bufferline")
        end
      }
      use {
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
        config = function()
          require("plugins.lualine")
        end
      }
      -- Devicons/color
      use "kyazdani42/nvim-web-devicons"
      use {
        "lewis6991/gitsigns.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        config = function()
          require("plugins.gitsigns")
        end
      }

      -- Colorschemes
      use "tjdevries/colorbuddy.vim"
      use "sam4llis/nvim-tundra"
      use "marko-cerovac/material.nvim"
      -- use "Th3Whit3Wolf/onebuddy"
      -- use "PHSix/nvim-hybrid"
      use "tanvirtin/monokai.nvim"
      -- use "bluz71/vim-nightfly-guicolors"
      -- use "olimorris/onedarkpro.nvim"
      use "ellisonleao/gruvbox.nvim"
      use "rebelot/kanagawa.nvim"

      if (not vim.g.minimal_plugin) then
        -- Formatter
        use {
          "mhartington/formatter.nvim",
          config = function()
            require("plugins.formatter")
          end
        }
        use "fladson/vim-kitty"
        use {
          "norcalli/nvim-colorizer.lua",
          config = function()
            require("colorizer").setup()
          end
        }
        use {
          "akinsho/nvim-toggleterm.lua",
          config = function()
            require("plugins.toggleterm")
          end
        }
        use {
          "lukas-reineke/indent-blankline.nvim",
          config = function()
            require("plugins.indent-blankline")
          end
        }
        use {
          "kyazdani42/nvim-tree.lua",
          requires = "kyazdani42/nvim-web-devicons",
          config = function()
            require("plugins.nvim-tree")
          end
        }

        -- Notetaking
        use {
          "oberblastmeister/neuron.nvim",
          branch = "unstable",
          config = function()
            require("plugins.neuron")
          end
        }

        -- use {
        --   "ggandor/lightspeed.nvim",
        --   requires = "tpope/vim-repeat"
        -- }
        use {
          "phaazon/hop.nvim",
          branch = "v2", -- optional but strongly recommended
          config = function()
            local hop = require("hop")
            local HintDirection = require("hop.hint").HintDirection
            require("hop").setup({})

            vim.keymap.set(
              "n",
              "<space>j",
              function()
                hop.hint_lines_skip_whitespace({ direction = HintDirection.AFTER_CURSOR })
              end,
              {}
            )
            vim.keymap.set(
              "n",
              "<space>k",
              function()
                hop.hint_lines_skip_whitespace({ direction = HintDirection.BEFORE_CURSOR })
              end,
              {}
            )
            vim.keymap.set(
              "n",
              "<space>h",
              function()
                hop.hint_words({ direction = HintDirection.BEFORE_CURSOR })
              end,
              {}
            )
            vim.keymap.set(
              "n",
              "<space>l",
              function()
                hop.hint_words({ direction = HintDirection.AFTER_CURSOR })
              end,
              {}
            )
          end
        }
        -- NON-LUA
        use "wellle/targets.vim" -- NON-LUA: ci' works on (), [], {}, < on entire line
        use { "mg979/vim-visual-multi", branch = "master" } -- NON-LUA
        use {
          "KabbAmine/vCoolor.vim",
          config = function()
            vim.g.vcoolor_map = ",co"
          end
        } -- NON-LUA
        use {
          "jpalardy/vim-slime",
          config = function()
            require("plugins.slime")
          end
        } -- NON-LUA
        use(
          {
            "iamcco/markdown-preview.nvim",
            run = function()
              vim.fn["mkdp#util#install"]()
            end
          }
        ) -- NON-LUA
      else
        print("MINIMAL PLUGIN SETUP")
      end
    end,
    config = {
      display = {
        open_fn = function()
          local result, win, buf =
          require("packer.util").float(
            {
              border = {
                { "╭", "FloatBorder" },
                { "─", "FloatBorder" },
                { "╮", "FloatBorder" },
                { "│", "FloatBorder" },
                { "╯", "FloatBorder" },
                { "─", "FloatBorder" },
                { "╰", "FloatBorder" },
                { "│", "FloatBorder" }
              }
            }
          )
          vim.api.nvim_win_set_option(win, "winhighlight", "NormalFloat:Normal")
          return result, win, buf
        end
      }
    }
  }
)
