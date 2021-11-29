-- Install packer if not yet installed
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  execute "packadd packer.nvim"
end

vim.cmd("autocmd BufWritePost plugins/init.lua PackerCompile") -- Auto compile when there are changes in plugins.lua

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
-- vim._update_package_paths()

return require("packer").startup(
  function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    -- Standard in many lua plugins. Contains functions you don't want to implement again...
    use "nvim-lua/plenary.nvim"
    use {"nvim-lua/popup.nvim", requires = "nvim-lua/plenary.nvim"}
    use {
      "rcarriga/nvim-notify",
      config = function()
        require("plugins.notify")
      end
    }

    -- LSP
    use {"williamboman/nvim-lsp-installer"}
    use {
      "neovim/nvim-lspconfig",
      config = function()
        require("plugins.lsp")
      end
    }

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
        "onsails/lspkind-nvim", -- Pretty symbols for lsp
        "ray-x/lsp_signature.nvim"
      },
      config = function()
        require("plugins.nvim-cmp")
      end
    }
    -- Snippets
    -- Custom snippets through lua-code
    use {
      "L3MON4D3/LuaSnip", -- Snippet engine
      requires = {"saadparwaiz1/cmp_luasnip"},
      config = function()
        require("plugins.luasnip")
      end
    }

    -- Treesitter
    use {
      "nvim-treesitter/nvim-treesitter",
      config = function()
        require("plugins.treesitter")
      end,
      run = ":TSUpdate"
    }
    use "nvim-treesitter/playground"

    -- Formatter
    use {
      "mhartington/formatter.nvim",
      config = function()
        require("plugins.formatter")
      end
    }

    -- Devicons/color
    use "kyazdani42/nvim-web-devicons"
    use {
      "norcalli/nvim-colorizer.lua",
      config = function()
        require("colorizer").setup()
      end
    }

    -- Tools
    use {
      "akinsho/nvim-toggleterm.lua",
      config = function()
        require("plugins.toggleterm")
      end
    }
    use {
      "ggandor/lightspeed.nvim",
      requires = "tpope/vim-repeat"
    }
    use {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("todo-comments").setup {}
      end
    }
    use {
      "folke/zen-mode.nvim",
      config = function()
        require("zen-mode").setup {}
      end
    }
    use {
      "folke/twilight.nvim",
      config = function()
        require("twilight").setup {
          dimming = {
            alpha = 0.4
          }
        }
      end
    }
    use "JoosepAlviste/nvim-ts-context-commentstring"
    use {
      "b3nj5m1n/kommentary",
      config = function()
        require("plugins.kommentary")
      end
    }
    use {
      "windwp/nvim-autopairs",
      config = function()
        require("nvim-autopairs").setup {}
      end
    }
    use {
      "lukas-reineke/indent-blankline.nvim",
      config = function()
        require("plugins.indent-blankline")
      end
    }
    -- show registers in floating window
    use "tversteeg/registers.nvim"
    -- Fuzzy Finding
    use {
      "kyazdani42/nvim-tree.lua",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("plugins.nvim-tree")
      end
    }
    use {
      "nvim-telescope/telescope.nvim",
      requires = {
        "nvim-lua/plenary.nvim"
      },
      config = function()
        require("plugins.telescope")
      end
    }
    use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}
    use {
      "sudormrfbin/cheatsheet.nvim",
      -- optional
      requires = {
        {"nvim-telescope/telescope.nvim"},
        {"nvim-lua/popup.nvim"},
        {"nvim-lua/plenary.nvim"}
      }
    }
    use "junegunn/fzf.vim" -- NON-LUA
    use {
      "junegunn/fzf",
      run = function()
        vim.fn["fzf#install"]()
      end
    } -- NON-LUA

    -- Notetaking
    use {
      "oberblastmeister/neuron.nvim",
      branch = "unstable",
      config = function()
        require("plugins.neuron")
      end
    }

    -- StatusLine / Bufferline
    use {
      "akinsho/nvim-bufferline.lua",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("plugins.nvim-bufferline")
      end
    }
    use {
      "lewis6991/gitsigns.nvim",
      requires = {"nvim-lua/plenary.nvim"},
      config = function()
        require("gitsigns").setup {keymaps = {}}
      end
    }
    use {
      "nvim-lualine/lualine.nvim",
      requires = {"kyazdani42/nvim-web-devicons", opt = true},
      config = function()
        require("plugins.lualine")
      end
    }

    -- NON-LUA
    -- --------------------------------
    use "wellle/targets.vim" -- NON-LUA: ci' works on (, [, {, < on entire line
    use {"mg979/vim-visual-multi", branch = "master"} -- NON-LUA
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
    use {
      "iamcco/markdown-preview.nvim",
      run = "cd app && yarn install",
      ft = "markdown",
      config = function()
        require("plugins.markdown-preview")
      end
    } -- NON-LUA

    -- tpope: so excused
    use "tpope/vim-repeat" -- NON-LUA
    use "tpope/vim-surround" -- NON-LUA

    -- Colorschemes
    use {
      "tjdevries/colorbuddy.vim"
      -- config = function()
      --   require("plugins.colorbuddy")
      -- end
    }
    use "Th3Whit3Wolf/onebuddy"
    use "gruvbox-community/gruvbox"
    use "tjdevries/gruvbuddy.nvim"
    use "PHSix/nvim-hybrid"
    use "tanvirtin/monokai.nvim"
    use "bluz71/vim-nightfly-guicolors"
    use "eddyekofo94/gruvbox-flat.nvim"
    use "olimorris/onedarkpro.nvim"
  end
)
