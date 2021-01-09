# ZSH info
# When specifying keys, most represent themselves (for example ‘A’ to ‘Z’). 
# Ctrl keys may be prefixed with ‘C-’ or ‘^’, and Alt (meta) with ‘M-’.
# The following special key names are accepted:
# Up, Down, Left, Right, BSpace, BTab, DC (Delete), End, Enter, Escape, F1 to F20,
# Send keys command to all panes
# Example: _tmux_send_keys_all_panes_ ls Enter
_tmux_send_keys_all_panes_ () {
  for _pane in $(tmux list-panes -F '#P'); do
    tmux send-keys -t ${_pane} "$@" Enter
  done
}

# FZF ###################################
# https://github.com/junegunn/fzf/wiki/Examples#tmux<Paste>
tmuxkillf () {
    local sessions
    sessions="$(tmux ls|fzf --exit-0 --multi)"  || return $?
    local i
    for i in "${(f@)sessions}"
    do
        [[ $i =~ '([^:]*):.*' ]] && {
            echo "Killing $match[1]"
            tmux kill-session -t "$match[1]"
        }
    done
}

# fs [FUZZY PATTERN] - Select selected tmux session
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fs() {
  local session
  session=$(tmux list-sessions -F "#{session_name}" | \
    fzf --query="$1" --select-1 --exit-0) &&
  tmux switch-client -t "$session"
}

# Tmux theme changer
# Opens fzf with the theme files listed in $pre then sourcing the chosen file
function _tmux_theme() {
  local pre="$HOME/.files/tmux/themes"
	local theme=$(ls $pre | fzf)
	tmux source-file "$pre/$theme"
  echo "Using $theme"
}
zle -N _tmux_theme ttheme


_tmux_rename_session_curdir () {
  if [ -z "$1" ]; then
    session_name=$(basename "$PWD" | sed -E 's/[.]/DOT_/g')
  else
    session_name=$1
  fi
  tmux rename-session $session_name
}

_tmux_rename_window_curdir () {
  if [ -z "$1" ]; then
    name=$(basename "$PWD" | sed -E 's/[.]/DOT_/g')
  else
    name=$1
  fi
  tmux rename-window $name
}

# alias tsname=_tmux_rename_session_curdir
# alias twname=_tmux_rename_window_curdir
alias tsn=_tmux_rename_session_curdir
alias twn=_tmux_rename_window_curdir
