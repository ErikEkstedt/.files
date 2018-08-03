# zsh-functions.zsh
# sourced from zshrc 

function price() { # {{{
  local pair="${1:-etheur}" # default pair
  local exchange="${2:-kraken}" # default exchange
  price=$(curl -s "https://api.cryptowat.ch/markets/$exchange/$pair/price" | jq ".result.price")
  echo "$pair: $price"
} #}}}
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
# Blurred transparency {{{
# https://www.reddit.com/r/kde/comments/6jzuwu/konsole_and_yakuake_blur/

case `uname` in
  Linux)
    # commands for Linux go here
	if [[ $(ps --no-header -p $PPID -o comm | grep -Ev '^(yakuake|konsole)$' ) ]]; then
			for wid in $(xdotool search --pid $PPID); do
				xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id $wid; done
	fi
  ;;
esac
# }}}
function ag() { #{{{
	git add .
	git commit -m "$1"
	git push
} #}}}
function init-project() { #{{{
	if [[ $1 ]]; then
		project-init.py $1
		cd $1
	else
		echo "No project name..."
		echo "Please add a name as argument"
	fi
} #}}}
function sms() { #{{{
	kdeconnect-cli --send-sms "$1" \
	--destination 0762060648 \
	-n Samsung\ Galaxy\ Note\ 4
} #}}}
function g() {  #{{{
	la | grep -i $1
} #}}}
function print_path() {  #{{{
	for p in $path;
	do
		echo "$p"
	done
} #}}}
# vf() {#{{{
# 	current_dir=$(pwd); cd
# 	local f=$(__fsel)
# 	echo "Open file: $f"
# 	local fullpath="$HOME/$f"
# 	zle fzf-redraw-prompt
# 	# echo "fullpath: $fullpath"
# 	# nvim "$fullpath"
# 	# files=(${(f)"$(locate -Ai -0 ~ | grep -z -vE '~$' | fzf --reverse --read0 -0 -1 -m)"})
# 	# local files="$(locate -Ai -0 ~ | grep -z -vE '~$' | fzf --reverse --read0 -0 -1 -m)"
# 	# nvim "${files}"
# 	# local ret=$?
# 	# typeset -f zle-line-init >/dev/null && zle zle-line-init
# }
# zle -N vf
# }}}
function cfg() { #{{{
	current_dir=$(pwd)
	cd ~/.files
	vim $(fzf)
} #}}}
function so() { #{{{
	local env=$(ls $HOME/miniconda3/envs | fzf)
	# source activate "$1"
	source activate "$env"
} 
alias sod="source deactivate"
zle -N so
#}}}
function junb() { #{{{
	jupyter notebook "$1"
} #}}}
# BINDINGS {{{
# alt+s to prepend 'sudo ' to current command and move to EOL
bindkey -s '^S' '^Asudo ^E'
bindkey -s '^Q' "exit\r"

# Vim
bindkey -M vicmd H beginning-of-line
bindkey -M vicmd L end-of-line

# FZF - functions
bindkey '^B' cd-from-home
bindkey -M vicmd '^B' cd-from-home

bindkey '^F' file-from-home
bindkey -M vicmd '^F' file-from-home

bindkey '^N' fzf-cd-widget
bindkey -M vicmd '^N' fzf-cd-widget

bindkey '^_' cd-from-root 
bindkey -M vicmd '^_' cd-from-root 

bindkey '^k' fzf-history-widget
bindkey -M vicmd '^k' fzf-history-widget

# }}}
