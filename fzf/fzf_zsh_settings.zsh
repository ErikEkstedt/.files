export FZF_DEFAULT_COMMAND='rg --files --hidden'
export FZF_DEFAULT_OPTS="--height 80% --reverse --preview 'bat --color always {}'"

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export FZF_ALT_C_COMMAND='fd --type d --hidden --exclude ".git"'
export FZF_ALT_C_OPTS="--preview 'tree -L 1 -C {}' "

export FZF_CTRL_R_OPTS="--reverse"
export FZF_COMPLETION_OPTS='+c -x'


# Functions
cd-from-home() { #{{{
	local current_dir=$(pwd)
  cd

  local dir
  dir="$(fd --type d --hidden | fzf)"

	if [[ -z "$dir" ]]; then
		cd $current_dir
		zle redisplay
		return 0
	fi

	cd "$dir"
	local ret=$?
	zle fzf-redraw-prompt
	typeset -f zle-line-init >/dev/null && zle zle-line-init
	return $ret
}
zle -N cd-from-home
#}}}

cd-from-root() {
	local current_dir=$(pwd)
  cd /

  local dir
  dir="$(fd --type d --hidden | fzf)"

	if [[ -z "$dir" ]]; then
		cd $current_dir
		zle redisplay
		return 0
	fi

	cd "$dir"
	local ret=$?
	zle fzf-redraw-prompt
	typeset -f zle-line-init >/dev/null && zle zle-line-init
	return $ret
}
zle -N cd-from-root

_fzf_compgen_path() { #{{{
	# - The first argument to the function ($1) is the base path to start traversal 
	# - See the source code (completion.{bash,zsh}) for the details. 
	fd --hidden --follow --exclude ".git" . "$1" 
} # }}}

_fzf_compgen_dir() { #{{{
	fd --type d -p --hidden --follow --exclude ".git" . "$1" 
}# }}}

# Find Files

home-files() {
  eval "${FZF_CTRL_T_COMMAND} ~" | fzf | while read item; do
    echo -n "${(q)item} "
  done
  local ret=$?
  echo
  return $ret
}

files-from-home() {
  LBUFFER="${LBUFFER}$(home-files)"
  local ret=$?
  zle reset-prompt
  return $ret
}
zle -N files-from-home

# WIP
# python-files() {
#   eval "${FZF_CTRL_T_COMMAND} --type py ~" | fzf | while read item; do
#     echo -n "${(q)item} "
#   done
#   local ret=$?
#   echo
#   return $ret
# }

# python-files-from-home() {
#   LBUFFER="${LBUFFER}$(python-files)"
#   local ret=$?
#   zle reset-prompt
#   return $ret
# }
# zle -N python-files-from-home

# fkill - kill processes - list only the ones you can kill. Modified the earlier script.
fkill() {
  local pid
  if [ "$UID" != "0" ]; then
    pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
  else
    pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
  fi

  if [ "x$pid" != "x" ]
  then
    echo $pid | xargs kill -${1:-9}
  fi
}

# Bindings
bindkey '^t' files-from-home
bindkey '^f' fzf-file-widget

bindkey -M vicmd '^R' fzf-history-widget

bindkey '^B' cd-from-home
bindkey -M vicmd '^B' cd-from-home

bindkey '^_' cd-from-root
bindkey -M vicmd '^_' cd-from-root

bindkey '^N' fzf-cd-widget
bindkey -M vicmd '^N' fzf-cd-widget
