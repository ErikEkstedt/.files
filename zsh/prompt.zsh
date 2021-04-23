# vim: ft=zsh

# Prompt
## autoload vcs and colors
autoload -U colors
colors

# http://zsh.sourceforge.net/Doc/Release/User-Contributions.html
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr "%F{green}●%f" # default 'S'
zstyle ':vcs_info:*' unstagedstr "%F{red}●%f" # default 'U'
zstyle ':vcs_info:*' use-simple true
zstyle ':vcs_info:git+set-message:*' hooks git-untracked
zstyle ':vcs_info:git*:*' formats " %{$fg[yellow]%}%{$fg[magenta]%} %b%{$reset_color%} %m%c%u " # default ' (%s)-[%b]%c%u-'
zstyle ':vcs_info:git*:*' actionformats " %{$fg[yellow]%}%{$fg[magenta]%} %b%{$reset_color%}|%a%m%c%u " # default ' (%s)-[%b|%a]%c%u-'

function +vi-git-untracked() {
  emulate -L zsh
  if [[ -n $(git ls-files --exclude-standard --others 2> /dev/null) ]]; then
    hook_com[unstaged]+="%F{blue}●%f"
  fi
}

precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt PROMPT_SUBST

## TODO
## Style Conda env
## look at examples from vcs -> https://github.com/zsh-users/zsh/blob/master/Misc/vcs_info-examples

NEWLINE=$'\n'
PROMPT="%{$fg[cyan]%}%3~%{$reset_color%}"
PROMPT+="\$vcs_info_msg_0_ "
PROMPT+="${NEWLINE}%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )%{$reset_color%}"
