# sourced from zshrc

function g() {
    la | grep -i $1
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

# Bindings
bindkey -s '^S' '^Asudo ^E'
bindkey -M vicmd H beginning-of-line
bindkey -M vicmd L end-of-line
bindkey -M vicmd J vi-cmd-down-line-history
bindkey -M vicmd K vi-cmd-up-line-history
