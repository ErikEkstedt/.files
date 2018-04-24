# ==== ZSHRC ====
stty -ixon # C-s, C-q 

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"
# if you do a 'rm *', Zsh will give you a sanity check!
setopt RM_STAR_WAIT
#allows to type Bash style comments in the command line
setopt interactivecomments 

# zmodload zsh/zprof # see time and processes

#==== Export {{{
export ZSH=/home/erik/.oh-my-zsh
export KEYTIMEOUT=1
#export TERM="screen-256color"
# export TERMINAL="st"
#
export TERM="xterm-256color"
export EDITOR='nvim'
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR
export BROWSER="google-chrome"
export LANG=en_US.UTF-8

# Conda / Python / Node Envs
export PATH=$HOMEE/.node_modules_global/bin:$PATH
export PATH=/home/erik/anaconda3/bin:${PATH}
export PATH=/home/erik/miniconda3/bin:$PATH
export ROBOSCHOOL_PATH=/home/erik/roboschool

export PATH=/usr/local/MATLAB/R2017b/bin:${PATH}
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/cuda/lib64
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/cuda-8.0/lib64
export GIO_EXTRA_MODULES=/usr/lib/x86_64-linux-gnu/gio/modules/

export GOROOT=/home/erik/go
export GOPATH=/home/erik/gopath
export PATH=$GOROOT/bin:${PATH}

# QT
export QT_VERSION="5.10.1"
export QT_DIR=$HOME/Qt
export QT_STUB="false"
export QT_DEBUG="false"

# temp fix/hack https://github.com/therecipe/qt/issues/549
export CGO_CXXFLAGS_ALLOW=".*" 
export CGO_LDFLAGS_ALLOW=".*" 
export CGO_CFLAGS_ALLOW=".*" 

# NVM
function _nvm() { # auto git
	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

# Color in Less Pager
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
export GROFF_NO_SGR=1                  # for konsole and gnome-terminal

# PhD 
export PATH=/home/erik/PhD/meta/:${PATH}
#}}}

#==== ZSH Themes {{{

plugins=(vi-mode zsh-autosuggestions)
ZSH_THEME="spaceship"
source $ZSH/oh-my-zsh.sh
source "/home/erik/.oh-my-zsh/custom/themes/spaceship.zsh-theme"

bindkey '^ ' autosuggest-accept

#}}}
#==== TMUX {{{
if [ "$TMUX" = "" ]; then 
	tmux new
fi
#}}}
#==== CryptoPrice {{{
function price() {
  local pair="${1:-etheur}" # default pair
  local exchange="${2:-kraken}" # default exchange
  price=$(curl -s "https://api.cryptowat.ch/markets/$exchange/$pair/price" | jq ".result.price")
  echo "$pair: $price"
}

# }}}
#==== Base16 {{{
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
#}}}
#==== FZF {{{
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_OPTS='--height 40% --reverse'
export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude ".git"'  
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --exclude ".git"'  

export FZF_COMPLETION_OPTS='+c -x'
export FZF_CTRL_R_OPTS="--reverse"
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_ALT_C_OPTS="--preview '(highlight -O ansi -l {} 1> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"

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
#}}}
zle -N cd-from-home
zle -N cd-from-root

# - The first argument to the function ($1) is the base path to start traversal 
# - See the source code (completion.{bash,zsh}) for the details. 
_fzf_compgen_path() { 
	fd --hidden --follow --exclude ".git" . "$1" 
} 

# Use fd to generate the list for directory completion 
_fzf_compgen_dir() { 
	fd --type d -p --hidden --follow --exclude ".git" . "$1" 
}

#}}}
##==== Custom {{{

# Blurred transparency
# https://www.reddit.com/r/kde/comments/6jzuwu/konsole_and_yakuake_blur/
if [[ $(ps --no-header -p $PPID -o comm | grep -Ev '^(yakuake|konsole)$' ) ]]; then
        for wid in $(xdotool search --pid $PPID); do
            xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id $wid; done
fi
function ag() { #{{{
	git add .
	git commit -m "$1"
	git push
} #}}}
function sms() { #{{{
	kdeconnect-cli --send-sms "$1" \
	--destination 0762060648 \
	-n Samsung\ Galaxy\ Note\ 4
} #}}}
function g() {  #{{{
	la | grep -i $1
} #}}}

vf() {
	local files
	# files=(${(f)"$(locate -Ai -0 ~ | grep -z -vE '~$' | fzf --reverse --read0 -0 -1 -m)"})
	files="$(locate -Ai -0 ~ | grep -z -vE '~$' | fzf --reverse --read0 -0 -1 -m)s"
	vim "${files[@]}"
}
zle -N vf
#}}}

source ~/.files/aliases >/dev/null 2>&1
# alt+s to prepend 'sudo ' to current command and move to EOL
bindkey -s '^S' '^Asudo ^E'
bindkey -s '^Q' "exit\r"
bindkey '^B' cd-from-home
bindkey '^N' fzf-cd-widget
bindkey '^_' cd-from-root 
# zprof


source "/home/erik/.oh-my-zsh/custom/themes/spaceship.zsh-theme"
