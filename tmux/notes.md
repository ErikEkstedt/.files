# Tmux


## Custom Rebindings

I hope I can remember to also state the original mappings. These will be in parenthesis (old mapping)


Switch between windows:

```bash
C-a 1 ...      switch to window 1, ..., 9, 0
C-a p          previous window
C-a n          next window
C-a C-a        ‘last’ (previously used) window (C-a l)
C-a w          choose window from a list
```

```bash
bind-key    -T prefix               C-Space           next-layout

bind-key    -T prefix               C-c               new-window -c "#{pane_current_path}"
bind-key    -T prefix               C-a               last-window

bind-key    -T prefix               C-b               previous-window
bind-key    -T prefix               C-n               next-window

bind-key    -T prefix               C-d               detach-client
bind-key    -T prefix               C-j               split-window -v -c "#{pane_current_path}"
bind-key    -T prefix               C-k               send-keys C-l
bind-key    -T prefix               C-l               split-window -h -c "#{pane_current_path}"
bind-key    -T prefix               C-o               rotate-window
bind-key    -T prefix               C-p               previous-window
bind-key    -T prefix               C-q               kill-pane
bind-key    -T prefix               C-r               run-shell /home/erik/.tmux/plugins/tmux-resurrect/scripts/restore.sh
bind-key    -T prefix               C-s               run-shell /home/erik/.tmux/plugins/tmux-resurrect/scripts/save.sh
bind-key    -T prefix               C-u               command-prompt "split-tab 'exec man %%'"
bind-key    -T prefix               C-z               suspend-client
bind-key    -T prefix               Space             next-layout
bind-key    -T prefix               !                 break-pane
bind-key    -T prefix               "                 split-window
bind-key    -T prefix               #                 list-buffers
bind-key    -T prefix               $                 command-prompt -I "#S" "rename-session '%%'"
bind-key    -T prefix               %                 split-window -h
bind-key    -T prefix               &                 confirm-before -p "kill-window #W? (y/n)" kill-window
bind-key    -T prefix               '                 command-prompt -p index "select-window -t ':%%'"
bind-key    -T prefix               (                 switch-client -p
bind-key    -T prefix               )                 switch-client -n
bind-key    -T prefix               ,                 command-prompt -I "#W" "rename-window '%%'"
bind-key    -T prefix               -                 delete-buffer
bind-key    -T prefix               .                 command-prompt "move-window -t '%%'"
bind-key    -T prefix               0                 select-window -t :=0
bind-key    -T prefix               1                 select-window -t :=1
bind-key    -T prefix               2                 select-window -t :=2
bind-key    -T prefix               3                 select-window -t :=3
bind-key    -T prefix               4                 select-window -t :=4
bind-key    -T prefix               5                 select-window -t :=5
bind-key    -T prefix               6                 select-window -t :=6
bind-key    -T prefix               7                 select-window -t :=7
bind-key    -T prefix               8                 select-window -t :=8
bind-key    -T prefix               9                 select-window -t :=9
bind-key    -T prefix               :                 command-prompt
bind-key    -T prefix               ;                 last-pane
bind-key    -T prefix               =                 choose-buffer
bind-key    -T prefix               ?                 list-keys
bind-key    -T prefix               D                 choose-client
bind-key    -T prefix               I                 run-shell /home/erik/.tmux/plugins/tpm/bindings/install_plugins
bind-key    -T prefix               L                 switch-client -l
bind-key    -T prefix               M                 select-pane -M
bind-key    -T prefix               R                 source-file /home/erik/.tmux.conf ; display-message "Config reloaded..."
bind-key    -T prefix               T                 break-pane
bind-key    -T prefix               U                 run-shell /home/erik/.tmux/plugins/tpm/bindings/update_plugins
bind-key    -T prefix               [                 copy-mode
bind-key    -T prefix               ]                 paste-buffer
bind-key    -T prefix               b                 previous-window
bind-key    -T prefix               c                 new-window -c "#{pane_current_path}"
bind-key    -T prefix               d                 detach-client
bind-key    -T prefix               f                 command-prompt "find-window '%%'"

bind-key    -T prefix               i                 display-message

bind-key    -T prefix               h                 resize-pane -L 5
bind-key    -T prefix               j                 resize-pane -D 5
bind-key    -T prefix               k                 resize-pane -U 5
bind-key    -T prefix               l                 resize-pane -R 5

bind-key    -T prefix               m                 select-pane -m
bind-key    -T prefix               n                 next-window
bind-key    -T prefix               o                 select-pane -t :.+
bind-key    -T prefix               p                 previous-window
bind-key    -T prefix               q                 display-panes
bind-key    -T prefix               r                 refresh-client
bind-key    -T prefix               s                 choose-tree -s
bind-key    -T prefix               t                 clock-mode
bind-key    -T prefix               v                 copy-mode
bind-key    -T prefix               w                 choose-tree -w
bind-key    -T prefix               x                 confirm-before -p "kill-pane #P? (y/n)" kill-pane
bind-key    -T prefix               z                 resize-pane -Z
bind-key    -T prefix               {                 swap-pane -U
bind-key    -T prefix               }                 swap-pane -D
bind-key    -T prefix               ~                 show-messages
bind-key    -T prefix               PPage             copy-mode -u
bind-key -r -T prefix               Up                select-pane -U
bind-key -r -T prefix               Down              select-pane -D
bind-key -r -T prefix               Left              select-pane -L
bind-key -r -T prefix               Right             select-pane -R
bind-key    -T prefix               M-1               select-layout even-horizontal
bind-key    -T prefix               M-2               select-layout even-vertical
bind-key    -T prefix               M-3               select-layout main-horizontal
bind-key    -T prefix               M-4               select-layout main-vertical
bind-key    -T prefix               M-5               select-layout tiled
bind-key    -T prefix               M-n               next-window -a
bind-key    -T prefix               M-o               rotate-window -D
bind-key    -T prefix               M-p               previous-window -a
bind-key -r -T prefix               M-Up              resize-pane -U 5
bind-key -r -T prefix               M-Down            resize-pane -D 5
bind-key -r -T prefix               M-Left            resize-pane -L 5
bind-key -r -T prefix               M-Right           resize-pane -R 5
bind-key -r -T prefix               C-Up              resize-pane -U
bind-key -r -T prefix               C-Down            resize-pane -D
bind-key -r -T prefix               C-Left            resize-pane -L
bind-key -r -T prefix               C-Right           resize-pane -R
```

## Alias
