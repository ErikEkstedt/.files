# (N)Vim settings

```bash
$NVIM_ROOT
├── after
│   └── ftplugin
├── autoload
│   ├── erik
│   └── lightline
│       └── colorscheme
├── colors
├── ftplugin: all my filetype-settings
├── mysnippets: custom snippets
├── oni: settings and mappings for Oni
├── plugin: In here all my settings are stored.
│   └── mappings: keymappings
│   └── plugins: all plugin settings
├── spell: spellcheck files
└── wip: for random scripts. testing, trying etc
```

## Todo
* searchable mappings, see [Functions.vim](Functions.vim)
  * pipe through fzf to fuzzy search mappings
  * I think fzf already have similar method to implement a mapping
	* nmap <leader><tab> <plug>(fzf-maps-n)

## [Work In Progress](./wip)
This is a folder to put scripts I plan to make or in which I just mess around.
This folder is not sourced.

* [conceal.vim](./wip/conceal.vim): syntax and conceal

## Forget Not
* nnoremap on regular bindings
* nmap ... <plug>

## Free mappings
| Leader (,) |  Ctrl |
| :---:|:---:|
| n | C-D |
| å |  |

## Objects
* onoremap
	* [ ] onoremap m i\(    " change inner math  \( aaaa \) -> normal! cmbb<esc> -> \( bb \)

## Plugins to check out ?
* [codi](https://github.com/metakirby5/codi.vim)
	* Interactive code scratchpad.
	* out of shell: python, js
