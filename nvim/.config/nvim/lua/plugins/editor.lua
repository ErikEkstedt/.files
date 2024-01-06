return {	 
{
    "nvim-telescope/telescope.nvim",
    dependencies = {
	{ 'nvim-lua/plenary.nvim' },
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
		function() require("telescope.builtin").find_files() end, 
		desc = "Search Files " },
    },
    config = function()
	local actions = require("telescope.actions")
  -- Disable folding in Telescope's result window.
  vim.api.nvim_create_autocmd("FileType", { pattern = "TelescopeResults", command = [[setlocal nofoldenable]] })

	require('telescope').setup({
		defaults = {
		sorting_strategy = "ascending",
		layout_config = {
    			horizontal = { prompt_position = "top" }
    		},
    		mappings = {
    		  i = {
    		    ["<c-x>"] = false,
    		    ["<c-v>"] = false,
    		    ["<c-l>"] = actions.select_vertical,
    		    ["<c-j>"] = actions.select_horizontal,
    		    ["<C-q>"] = actions.send_to_qflist,
    		    ["<cr>"] = actions.select_default
    		  },
    		  n = {
    		    ["q"] = actions.close,
    		    ["<c-x>"] = false,
    		    ["<c-v>"] = false,
    		    ["<c-l>"] = actions.select_vertical,
    		    ["<c-j>"] = actions.select_horizontal,
    		    ["<C-q>"] = actions.close,
    		    ["<cr>"] = actions.select_default
    		  }
    		}
	}
	})
    end
}
}
