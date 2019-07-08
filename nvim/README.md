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


* `vim --startuptime vim.log`
  - See startup



# Misc

- onoremap
  - [ ] onoremap m i\( " change inner math \( aaaa \) -> normal! cmbb<esc> -> \( bb \)
- Plugins to check out ?
  - [codi](https://github.com/metakirby5/codi.vim)
    _ Interactive code scratchpad.
    _ out of shell: python, js

search/replace commands

- Substitute entire buffer `%s/`
- Substitute enitre line `s/`
- Not preceded by whitespace `\s\@<!`
- One or more equal characters `=\+`
- Not followed by whitespace `\s\@!`
- Add spaces around the match `/\0`
