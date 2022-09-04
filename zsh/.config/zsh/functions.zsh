# sourced from zshrc

function g() {
    ls -a | grep -i $1
}
function print_path() {  #{{{
    function _print_path() {  #{{{
        for p in $path; do
            echo "$p"
        done
    } #}}}
_print_path | bat
} #}}}

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
}  #}}}

function _browser_tab() {
  if [ -z $(pgrep -i $BROWSER) ]; then
    echo $process "is NOT running."
    $BROWSER --new-tab $@ &!
  else
    echo $process "is running."
    $BROWSER --new-tab $@
  fi
}

# Movement
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

# Tmux
function tns() {
  _session_exists() {
    tmux list-sessions | sed -E 's/:.*$//' | grep -q "^$session_name$"
  }
  _not_in_tmux() {
    [ -z "$TMUX" ]
  }

  if [ -z $1 ]; then
    session_name=$(basename "$PWD" | sed -E 's/[.]/DOT/g' | sed -E 's/DOTfiles/DOTFiles/g')
  else
    session_name=$1
  fi

  if _not_in_tmux; then
    tmux new-session -As "$session_name"
  else
    if ! _session_exists; then
      (TMUX='' tmux new-session -Ad -s "$session_name")
    fi
    tmux switch-client -t "$session_name"
  fi
}
