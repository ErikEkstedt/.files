# vim: fdm=marker
# zsh-functions.zsh
# sourced from zshrc


################################################################
# Misc{{{

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

#}}}

################################################################
# Conda{{{

function so() { #{{{
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


# Ranger {{{

function ranger {
    # Quitting ranger with "q" puts you in the directory where you quit
    local IFS=$'\t\n'
    local tempfile="$(mktemp -t tmp.XXXXXX)"
    local ranger_cmd=(
        command
        ranger
        --cmd="map q chain shell echo %d > "$tempfile"; quitall"
    )

    ${ranger_cmd[@]} "$@"
    if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
        cd -- "$(cat "$tempfile")" && clear || return
    fi
    command rm -f -- "$tempfile" 2>/dev/null
}

# }}}


################################################################

################################################################
# BINDINGS {{{

bindkey -s '^S' '^Asudo ^E'
# bindkey -s '^Q' "exit\r"
# bindkey -s '^Q' 'tmux switch-client -n \; kill-session -t "$(tmux display-message -p "#S")" || tmux kill-session\r'
bindkey -M vicmd H beginning-of-line
bindkey -M vicmd L end-of-line
# }}}
