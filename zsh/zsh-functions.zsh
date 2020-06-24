# vim: fdm=marker
# zsh-functions.zsh
# sourced from zshrc

function price() { # {{{
    local pair="${1:-etheur}" # default pair
    local exchange="${2:-kraken}" # default exchange
    price=$(curl -s "https://api.cryptowat.ch/markets/$exchange/$pair/price" | jq ".result.price")
    echo "$pair: $price"
} #}}}
function g() {  #{{{
    la | grep -i $1
} #}}}
function print_path() {  #{{{
    function _print_path() {  #{{{
        for p in $path; do
            echo "$p"
        done
    } #}}}
_print_path | bat
} #}}}
# Ranger {{{
# function ranger {
#     # Quitting ranger with "q" puts you in the directory where you quit
#     local IFS=$'\t\n'
#     local tempfile="$(mktemp -t tmp.XXXXXX)"
#     local ranger_cmd=(
#         command
#         ranger
#         --cmd="map q chain shell echo %d > "$tempfile"; quitall"
#     )
#     ${ranger_cmd[@]} "$@"
#     if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
#         cd -- "$(cat "$tempfile")" && clear || return
#     fi
#     command rm -f -- "$tempfile" 2>/dev/null
# }
# }}}
# LF {{{
lfcd () {
  tmp="$(mktemp)"
  lf -last-dir-path="$tmp" "$@"
  if [ -f "$tmp" ]; then
    dir="$(cat "$tmp")"
    rm -f "$tmp"
    if [ -d "$dir" ]; then
      if [ "$dir" != "$(pwd)" ]; then
        cd "$dir"
      fi
    fi
  fi
}

lfcd_zsh () {
  tmp="$(mktemp)"
  lf -last-dir-path="$tmp" "$@"
  if [ -f "$tmp" ]; then
    dir="$(cat "$tmp")"
    rm -f "$tmp"
    if [ -d "$dir" ]; then
      if [ "$dir" != "$(pwd)" ]; then
        cd "$dir"
      fi
    fi
  fi
}
zle -N lfcd_zsh

# }}}
# Browser{{{
function _browser_tab() {
  if [ -z $(pgrep -i $BROWSER) ]; then
    echo $process "is NOT running."
    $BROWSER --new-tab $@ &!
  else
    echo $process "is running."
    $BROWSER --new-tab $@
  fi
}
#}}}
# Conda{{{
function so() {
  local env
  if [ -z "$1" ]; then
    env=$(ls $HOME/miniconda3/envs | fzf)
    # source activate "$1"
  else
    env=$1
  fi
  conda activate "$env"
}
alias sod="conda deactivate"
zle -N so
#}}}
# Movement {{{
vi-cmd-up-line-history() {
zle vi-cmd-mode
zle up-line-or-history
}
zle -N vi-cmd-up-line-history

vi-cmd-down-line-history() {
zle vi-cmd-mode
zle down-line-or-history
}
zle -N vi-cmd-down-line-history
# }}}
# BINDINGS {{{

bindkey -s '^S' '^Asudo ^E'
# bindkey -s '^Q' "exit\r"
# bindkey -s '^Q' 'tmux switch-client -n \; kill-session -t "$(tmux display-message -p "#S")" || tmux kill-session\r'
bindkey -M vicmd H beginning-of-line
bindkey -M vicmd L end-of-line
bindkey -M vicmd J vi-cmd-down-line-history
bindkey -M vicmd K vi-cmd-up-line-history
bindkey -M vicmd '^?' clear-screen  # I would like to bind C-Backspace to clear in insert mode

# bindkey -s '^f' 'lfcd\C-M'
# bindkey '^f' lfcd_zsh
# bindkey -s vicmd '^f' 'ilfcd\C-M'
# bindkey -M vicmd '^F' lfcd_zsh


# tree
# bindkey -s '^d' 'tree -d\C-M'
