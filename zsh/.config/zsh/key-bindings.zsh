# KEY BINDINGS
# This file should (probably) be sourced last

# MOVEMENT
bindkey -s '^S' '^Asudo ^E'
bindkey -M vicmd H beginning-of-line
bindkey -M vicmd L end-of-line
bindkey -M vicmd J vi-cmd-down-line-history
bindkey -M vicmd K vi-cmd-up-line-history
# Ctrl-W (insert-mode) deletes current word


# FZF
if [[ -f ~/.fzf.zsh  ]]; then
  bindkey '^P' fzf-dir-change-projects
  bindkey '^B' fzf-dir-change-home
  bindkey '^Y' fzf-dir-change-dot
  bindkey '^O' fzf-dir-change-cwd
  bindkey '^F' fzf-file-widget
  bindkey -M vicmd '^P' fzf-dir-change-projects
  bindkey -M vicmd '^B' fzf-dir-change-home
  bindkey -M vicmd '^Y' fzf-dir-change-dot
  bindkey -M vicmd '^O' fzf-dir-change-cwd
fi
