# vim: fdm=marker
# zsh-functions.zsh
# sourced from zshrc

# FZF
################################################################

cd-from-home() { #{{{
	current_dir=$(pwd); cd
	local cmd="${FZF_ALT_C_COMMAND:-"command find -L . -mindepth 1 \
		\\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype \
		'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune \
		-o -type d -print 2> /dev/null | cut -b3-"}"

	setopt localoptions pipefail 2> /dev/null
	local dir="$(eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} \
	  --reverse $FZF_DEFAULT_OPTS $FZF_ALT_C_OPTS" \
	  $(__fzfcmd) +m)"
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
bindkey '^B' cd-from-home
bindkey -M vicmd '^B' cd-from-home
#}}}

file-from-home() { #{{{
	current_dir=$(pwd); cd
	local f=$(__fsel)
	echo "Open file: $f"
	local fullpath="$HOME/$f"
	# echo "fullpath: $fullpath"
	xdg-open $fullpath

	# if [[ -z "$f" ]]; then
	# 	cd $current_dir
	# 	zle redisplay
	# 	return 0
	# fi
	local ret=$?
	zle fzf-redraw-prompt
	typeset -f zle-line-init >/dev/null && zle zle-line-init
	# exec $f
	# return $ret
}
zle -N file-from-home
bindkey '^F' file-from-home
bindkey -M vicmd '^F' file-from-home
# }}}

cd-from-root() { #{{{
	current_dir=$(pwd); cd /
	local cmd="${FZF_ALT_C_COMMAND:-"command find -L . -mindepth 1 \
		\\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype \
		'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune \
		-o -type d -print 2> /dev/null | cut -b3-"}"

	setopt localoptions pipefail 2> /dev/null
	local dir="$(eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} \
	  --reverse $FZF_DEFAULT_OPTS $FZF_ALT_C_OPTS" \
	  $(__fzfcmd) +m)"
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
bindkey '^_' cd-from-root 
bindkey -M vicmd '^_' cd-from-root 
#}}}

_fzf_compgen_path() { #{{{
	# - The first argument to the function ($1) is the base path to start traversal 
	# - See the source code (completion.{bash,zsh}) for the details. 
	fd --hidden --follow --exclude ".git" . "$1" 
} # }}}

_fzf_compgen_dir() { #{{{
	# Use fd to generate the list for directory completion 
	fd --type d -p --hidden --follow --exclude ".git" . "$1" 
}# }}}

# Am I using this? commented out until better understanding
# bindkey '^k' fzf-history-widget
# bindkey -M vicmd '^k' fzf-history-widget

bindkey '^N' fzf-cd-widget
bindkey -M vicmd '^N' fzf-cd-widget

# Misc
################################################################

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
	for p in $path; do
		echo "$p"
	done
} #}}}

function cfg() { #{{{
  '''Open vim from everywhere at ~/.files directory'''
	current_dir=$(pwd)
	cd ~/.files
	vim $(fzf)
} #}}}

# Conda/python/jupyter
################################################################

function so() { #{{{
	local env=$(ls $HOME/miniconda3/envs | fzf)
	# source activate "$1"
	source activate "$env"
} 
alias sod="source deactivate"
zle -N so
#}}}

# This is just an alias...
function junb() { #{{{
	jupyter notebook "$1"
} #}}}

# OS
case Linux in
  Darwin)
    # commands for OS X go here
    source ~/.files/zsh/zsh-functions-mac.zsh
    ;;
  Linux)
    # commands for Linux go here
    source ~/.files/zsh/zsh-functions-kde.zsh
    ;;
esac

# BINDINGS
################################################################

bindkey -s '^S' '^Asudo ^E'
# bindkey -s '^Q' "exit\r"
bindkey -s '^Q' 'tmux switch-client -n \; kill-session -t "$(tmux display-message -p "#S")" || tmux kill-session\r'
bindkey -M vicmd H beginning-of-line
bindkey -M vicmd L end-of-line
