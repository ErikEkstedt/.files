local actions = require('telescope.actions')

local mappings = {
      -- To disable a keymap, put [map] = false
      i = {
        ["<c-x>"] = false,
        ["<c-v>"] = false,
        ["<c-l>"] = actions.select_vertical,
        ["<c-j>"] = actions.select_horizontal,
      },
      n = {
        ["<c-x>"] = false,
        ["<c-v>"] = false,
        ["<c-l>"] = actions.select_vertical,
        ["<c-j>"] = actions.select_horizontal,
      }
    }

local vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case"
    }

local file_ignore_patterns = {
  "node_modules",
  "%.pt", "%.npy", "%.chpt", "%.ckpt", "%data/%/",
  "%.zip", "%out.tfevents",
  "%.png", "%.jpeg", "%.mp3", "%.wav", "%.flac", "%.sph"
}



require('telescope').setup{
  defaults = {
    vimgrep_arguments = vimgrep_arguments,
    prompt_position = "top",
    prompt_prefix = ">",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    mappings = mappings,
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = file_ignore_patterns,
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    shorten_path = true,
    winblend = 0,
    width = 0.75,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.8,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰"},
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default { }, currently unsupported for shells like cmd.exe / powershell.exe
    file_previewer = require'telescope.previewers'.cat.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_cat.new`
    grep_previewer = require'telescope.previewers'.vimgrep.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_vimgrep.new`
    qflist_previewer = require'telescope.previewers'.qflist.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_qflist.new`
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
  },
	extensions = {
		fzy_native = {
				override_generic_sorter = false,
				override_file_sorter = true,
		},
		fzf_writer = {
			minimum_grep_characters = 2,
			minimum_files_characters = 3,
			-- Disabled by default.
			-- Will probably slow down some aspects of the sorter, but can make color highlights.
			-- I will work on this more later.
			use_highlighter = true,
		}
	}
}


require('telescope').load_extension('fzy_native')
require('telescope').load_extension('fzf_writer')


local km = {noremap=true, silent=true}
local t = "<cmd>lua require('telescope')"
local bi = "<cmd>lua require('telescope.builtin')"

-- FileFinding
vim.api.nvim_set_keymap('n', '<LocalLeader>ff', bi .. ".find_files()<cr>", km)
vim.api.nvim_set_keymap('n', '<LocalLeader>fg', bi .. ".git_files()<cr>", km)
vim.api.nvim_set_keymap('n', '<LocalLeader>fb', bi .. ".buffers()<cr>", km)
vim.api.nvim_set_keymap('n', '<LocalLeader>fc', bi .. ".find_files{cwd='~/.files'}<cr>", km)
vim.api.nvim_set_keymap('n', '<LocalLeader>ll', bi .. ".current_buffer_fuzzy_find()<cr>", km)

-- Too slow. Handled by FZF
-- vim.api.nvim_set_keymap('n', '<LocalLeader>fw', t .. ".extensions.fzf_writer.grep()<cr>", km)

-- Misc
vim.api.nvim_set_keymap('n', '<LocalLeader>he', bi .. ".help_tags()<cr>", km)
vim.api.nvim_set_keymap('n', '<LocalLeader>ma', bi .. ".keymaps()<cr>", km)
vim.api.nvim_set_keymap('n', '<LocalLeader>hi', bi .. ".highlights()<cr>", km)
vim.api.nvim_set_keymap('n', '<LocalLeader>cc', bi .. ".commands()<cr>", km)

-- " Too slow....
-- vim.api.nvim_set_keymap('n', '<LocalLeader>fp', bi .. ".find_files{cwd='~/projects'}<cr>", km)
-- vim.api.nvim_set_keymap('n', '<LocalLeader>fi', t .. ".extensions.fzf_writer.files()<cr>", km)
-- " nnoremap <leader>fi <cmd>lua require('telescope.builtin').find_files{cwd='~'}<cr>
-- " nnoremap <leader>fp <cmd>lua require('telescope.builtin').find_files{cwd='~/projects'}<cr>
-- " nnoremap <leader>ff <cmd>lua require('telescope').extensions.fzf_writer.files()<cr>
-- " Can't open from other directories... only starts in cwd
-- " nnoremap <leader>fi <cmd>lua require('telescope').extensions.fzf_writer.files({cwd='~'})<cr>
-- " nnoremap <leader>fp <cmd>lua require('telescope').extensions.fzf_writer.files{opts={cwd='~/projects'}}<cr>

-- " Strings
-- nnoremap <leader>fs <cmd>lua require('telescope.builtin').grep_string()<cr>
-- " nnoremap <leader>fw <cmd>lua require('telescope.builtin').live_grep()<cr>
-- nnoremap <leader>fw <cmd>lua require('telescope').extensions.fzf_writer.grep()<cr>

-- " Git
-- nnoremap <leader>gc <cmd>lua require('telescope.builtin').git_commits()<cr>
-- nnoremap <leader>gb <cmd>lua require('telescope.builtin').git_bcommits()<cr>
-- nnoremap <leader>gs <cmd>lua require('telescope.builtin').git_status()<cr>
-- nnoremap <leader>gbr <cmd>lua require('telescope.builtin').git_branches()<cr>

-- " Misc
-- nnoremap <leader>rl <cmd>lua require('telescope.builtin').reloader()<cr>
