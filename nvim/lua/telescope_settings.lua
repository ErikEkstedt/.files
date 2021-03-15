local actions = require('telescope.actions')
require('telescope').load_extension('fzf_writer')
require('telescope').load_extension('fzy_native')

require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_position = "top",
    prompt_prefix = ">",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    mappings = {
      i = {
        -- To disable a keymap, put [map] = false
        -- So, to not map "<C-n>", just put
        ["<c-x>"] = false,
        ["<c-v>"] = false,
        ["<c-l>"] = actions.goto_file_selection_vsplit,
        ["<c-j>"] = actions.goto_file_selection_split,
      },
      n = {
        ["<c-x>"] = false,
        ["<c-v>"] = false,
        ["<c-l>"] = actions.goto_file_selection_vsplit,
        ["<c-j>"] = actions.goto_file_selection_split,
      }
    },
    layout_defaults = {
      -- TODO add builtin options.
    },
    -- file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {
      '%.pt',
      '%.npy',
      '%.chpt',
      '%data/%/',
      '%.zip',
      '%out.tfevents',
      '%.png',
      '%.jpeg',
      '%.mp3',
      '%.wav',
      '%.flac',
      '%.sph',
    },
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    shorten_path = true,
    winblend = 0,
    width = 0.75,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.8,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default { }, currently unsupported for shells like cmd.exe / powershell.exe
    file_previewer = require'telescope.previewers'.cat.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_cat.new`
    grep_previewer = require'telescope.previewers'.vimgrep.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_vimgrep.new`
    qflist_previewer = require'telescope.previewers'.qflist.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_qflist.new`
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  },
  extensions = {
    fzf_writer = {
      minimum_grep_characters = 3,
      minimum_files_characters = 3,
      -- Disabled by default.
      -- Will probably slow down some aspects of the sorter, but can make color highlights.
      -- I will work on this more later.
      use_highlighter = true,
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
  }
}
