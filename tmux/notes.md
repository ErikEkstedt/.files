# Tmux


## Custom Rebindings

```
PREFIX: C-a
```



Useful
```Bash
bind-key    -T prefix       v          copy-mode
bind-key    -T prefix       [          copy-mode
bind-key    -T prefix       ]          paste-buffer

bind-key    -T prefix       C-k        send-keys C-l (clear terminal)

bind-key    -T prefix       ?          list-keys
bind-key    -T prefix       R          source-file /home/erik/.tmux.conf ; display-message "Config reloaded..."
```

Movement
```Bash
bind-key    -T prefix       C-a        last-window
bind-key    -T prefix       C-b | b | C-p | p    previous-window
bind-key    -T prefix       C-n | n | M-n        next-window 

bind-key    -T prefix       C-o        rotate-window
bind-key    -T prefix       M-o        rotate-window -D

bind-key -n                 M-h        select-pane -L
bind-key -n                 M-j        select-pane -D
bind-key -n                 M-k        select-pane -U
bind-key -n                 M-l        select-pane -R
bind-key -n                 M-\        select-pane -l

bind-key -r -T prefix       Up         select-pane -U
bind-key -r -T prefix       Down       select-pane -D
bind-key -r -T prefix       Left       select-pane -L
bind-key -r -T prefix       Right      select-pane -R

bind-key    -T prefix       m          select-pane -m
bind-key    -T prefix       o          select-pane -t :.+

bind-key    -T prefix       (          switch-client -p
bind-key    -T prefix       )          switch-client -n
bind-key    -T prefix       {          swap-pane -U
bind-key    -T prefix       }          swap-pane -D

bind-key    -T prefix       !          break-pane
bind-key    -T prefix       T          break-pane
```

Sophisticated
```Bash
bind-key    -T prefix       w          choose window from a list
bind-key    -T prefix       =          choose-buffer

bind-key    -T prefix       D          choose-client
bind-key    -T prefix       f          command-prompt "find-window '%%'"

bind-key    -T prefix       s          choose-tree -s
bind-key    -T prefix       w          choose-tree -w
```

Split
```Bash
bind-key    -T prefix       %          split-window -h
bind-key    -T prefix       "          split-window
bind-key    -T prefix       C-j        split-window -v -c "#{pane_current_path}"
bind-key    -T prefix       C-l        split-window -h -c "#{pane_current_path}"
```

Layouts:
```Bash
bind-key    -T prefix       Space      next-layout
bind-key    -T prefix       C-Space    next-layout
bind-key    -T prefix       M-1        select-layout even-horizontal
bind-key    -T prefix       M-2        select-layout even-vertical
bind-key    -T prefix       M-3        select-layout main-horizontal
bind-key    -T prefix       M-4        select-layout main-vertical
bind-key    -T prefix       M-5        select-layout tiled
```

Resize
```Bash
bind-key    -T prefix       z          resize-pane -Z (Zoom toggle focus. fill terminal or regular)

bind-key    -T prefix       h          resize-pane -L 5
bind-key    -T prefix       j          resize-pane -D 5
bind-key    -T prefix       k          resize-pane -U 5
bind-key    -T prefix       l          resize-pane -R 5
bind-key -r -T prefix       M-Up       resize-pane -U 5
bind-key -r -T prefix       M-Down     resize-pane -D 5
bind-key -r -T prefix       M-Left     resize-pane -L 5
bind-key -r -T prefix       M-Right    resize-pane -R 5

bind-key -r -T prefix       C-Up       resize-pane -U
bind-key -r -T prefix       C-Down     resize-pane -D
bind-key -r -T prefix       C-Left     resize-pane -L
bind-key -r -T prefix       C-Right    resize-pane -R
```

Commands:
```Bash
bind-key    -T prefix       :          command-prompt
bind-key    -T prefix       $          command-prompt -I "#S" "rename-session '%%'"
bind-key    -T prefix       ,          command-prompt -I "#W" "rename-window '%%'"
bind-key    -T prefix       .          command-prompt "move-window -t '%%'"
bind-key    -T prefix       '          command-prompt -p index "select-window -t ':%%'"
bind-key    -T prefix       #          list-buffers
```


```bash
bind-key    -T prefix       r          refresh-client
bind-key    -T prefix       C-c        new-window -c "#{pane_current_path}"
bind-key    -T prefix       c          new-window -c "#{pane_current_path}"
bind-key    -T prefix       C-d        detach-client
bind-key    -T prefix       d          detach-client
bind-key    -T prefix       C-q        kill-pane
bind-key    -T prefix       -          delete-buffer
bind-key    -T prefix       ;          last-pane
bind-key    -T prefix       C-u        command-prompt "split-tab 'exec man %%'"
bind-key    -T prefix       C-z        suspend-client
```

Even neccessary?
```Bash
bind-key    -T prefix       &          confirm-before -p "kill-window #W? (y/n)" kill-window
bind-key    -T prefix       x          confirm-before -p "kill-pane #P? (y/n)" kill-pane
```

Plugins
```Bash
bind-key    -T prefix       C-r        run-shell $HOME/.tmux/plugins/tmux-resurrect/scripts/restore.sh
bind-key    -T prefix       C-s        run-shell $HOME/.tmux/plugins/tmux-resurrect/scripts/save.sh
bind-key    -T prefix       I          run-shell $HOME/.tmux/plugins/tpm/bindings/install_plugins
bind-key    -T prefix       U          run-shell $HOME/.tmux/plugins/tpm/bindings/update_plugins
```

Fun/Misc
```Bash
bind-key    -T prefix       q          display-panes
bind-key    -T prefix       t          clock-mode
bind-key    -T prefix       i          display-message
bind-key    -T prefix       ~          show-messages
```

## Alias

```Bash
Variable name          Alias    Replaced with
host                   "#H"       Hostname of local host
host_short             "#h"       Hostname of local host (no domain name)
pane_id                "#D"       Unique pane ID
pane_index             "#P"       Index of pane
pane_title             "#T"       Title of pane
session_name           "#S"       Name of session
window_flags           "#F"       Window flags
window_index           "#I"       Index of window
window_name            "#W"       Name of window
```
