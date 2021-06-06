-- Install packer if not yet installed
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

vim.cmd('autocmd BufWritePost plugins/init.lua PackerCompile') -- Auto compile when there are changes in plugins.lua

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
-- vim._update_package_paths()

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Standard in many lua plugins. Contains functions you don't want to implement again...
  use 'nvim-lua/plenary.nvim'
  use {'nvim-lua/popup.nvim', requires = 'nvim-lua/plenary.nvim'}

	-- Devicons/color
  use 'kyazdani42/nvim-web-devicons'
	use 'norcalli/nvim-colorizer.lua'
	use {'KabbAmine/vCoolor.vim', config=function() vim.g.vcoolor_map = ',co' end }  -- NON-LUA

	-- Tools
	use {'phaazon/hop.nvim', config = function() require('plugins.hop') end}
  -- use {"folke/which-key.nvim", config = function() require('plugins.whichkey') end}
	use {'jpalardy/vim-slime', config=function() require('plugins.slime') end}  -- NON-LUA
  use {'mg979/vim-visual-multi', branch='master' }  -- NON-LUA
	use 'Raimondi/delimitMate'  -- NON-LUA

  -- LSP
  use {'neovim/nvim-lspconfig', config = function() require('plugins.lsp') end }
  use {'hrsh7th/nvim-compe', config = function() require('plugins.nvim-compe') end }
  use {'glepnir/lspsaga.nvim', config = function() require('plugins.lspsaga') end }
  use {'nvim-treesitter/nvim-treesitter', config=function() require('plugins.treesitter') end, run = ':TSUpdate'}
  use {"ray-x/lsp_signature.nvim"}
  use 'nvim-treesitter/playground'
  -- TODO
  -- use "rafamadriz/friendly-snippets"
  -- use "hrsh7th/vim-vsnip"
	use 'SirVer/ultisnips'  -- NON-LUA
	use 'honza/vim-snippets'  -- NON-LUA

	-- Fuzzy Finding
  use {
		'nvim-telescope/telescope.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope-fzf-writer.nvim',
			'nvim-telescope/telescope-fzy-native.nvim'
		},
		config = function() require('plugins.telescope') end
	}
  use {
    'sudormrfbin/cheatsheet.nvim',
    -- optional
    requires = {
      {'nvim-telescope/telescope.nvim'},
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
    }
  }
	use 'junegunn/fzf.vim'  -- NON-LUA
	use {'junegunn/fzf', run=function() vim.fn['fzf#install']() end }  -- NON-LUA

	-- Notetaking
	use {
		'oberblastmeister/neuron.nvim',
		branch='unstable',
		config= function() require('plugins.neuron') end
	}
  use {'iamcco/markdown-preview.nvim', run='cd app && yarn install', ft='markdown', config=function() require('plugins.markdown-preview') end}  -- NON-LUA

	-- Code format
	use 'psf/black'  -- NON-LUA
	use {'prettier/vim-prettier', run='yarn install', config=function() require('plugins.prettier') end}  -- NON-LUA

	-- StatusLine / Bufferline
	use {'akinsho/nvim-bufferline.lua', requires='kyazdani42/nvim-web-devicons'}
	use {
		'lewis6991/gitsigns.nvim',
		requires = {'nvim-lua/plenary.nvim'},
    config = function() require('gitsigns').setup() end
  }
  use {'vim-airline/vim-airline', config=function() require('plugins.airline') end}  -- NON-LUA
  use 'vim-airline/vim-airline-themes'  -- NON-LUA

  -- Window movements
  use 'christoomey/vim-tmux-navigator'  -- NON-LUA

	-- tpope
	use 'tpope/vim-commentary'  -- NON-LUA
  use 'tpope/vim-repeat'  -- NON-LUA
  use 'tpope/vim-surround'  -- NON-LUA

	-- ci' works on (, [, {, < on entire line
	use 'wellle/targets.vim'  -- NON-LUA

	-- Colorschemes
	use 'tjdevries/colorbuddy.vim'
	use 'Th3Whit3Wolf/onebuddy'
  use 'gruvbox-community/gruvbox'
  use 'tjdevries/gruvbuddy.nvim'
	use 'PHSix/nvim-hybrid'
  use 'tanvirtin/monokai.nvim'
	use 'bluz71/vim-nightfly-guicolors'
	use 'eddyekofo94/gruvbox-flat.nvim'
end)
