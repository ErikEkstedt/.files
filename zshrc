# ========= SETTINGS ============
# ZSH ubuntu 16.04 - simple terminal
# Erik
# 2017

# zmodload zsh/zprof # see time and processes

#====== Export ========={{{
export ZSH=/home/erik/.oh-my-zsh
export KEYTIMEOUT=1
#export TERM="screen-256color"
#export TERM="xterm-256color"
export TERMINAL="st"
export EDITOR='nvim'
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR

export ROBOSCHOOL_PATH=/home/erik/roboschool
export LANG=en_US.UTF-8
export PATH=/home/erik/anaconda3/bin:${PATH}
export BROWSER="firefox"
export BROWSERCLI="w3m"
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

stty -ixon # C-s, C-q 
#}}}
#====== ZSH Themes ====={{{
#ZSH_THEME="terminalparty"
ZSH_THEME="spaceship"

# if you do a 'rm *', Zsh will give you a sanity check!
setopt RM_STAR_WAIT

#allows to type Bash style comments in the command line
setopt interactivecomments 

plugins=(gitfast python git-extras tmux vi-mode pip)

#}}}
#====== Source ========={{{
source ~/.files/aliases >/dev/null 2>&1
source $ZSH/oh-my-zsh.sh
source "/home/erik/.oh-my-zsh/custom/themes/spaceship.zsh-theme"
# source /opt/ros/kinetic/setup.zsh
HYPHEN_INSENSITIVE="true"
#}}}
#==== TMUX ===={{{
if [ "$TMUX" = "" ]; then 
	tmux new
	(cat ~/.cache/wal/sequences &)
fi
#}}}
#==== Base16 =={{{
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

#}}}
#==== PyWal ==={{{
(cat ~/.cache/wal/sequences &)

#}}}
#==== FZF ====={{{
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_OPTS='--height 40% --reverse'
export FZF_COMPLETION_OPTS='+c -x'
export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude ".git"'  # export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""' --color=always 
export FZF_CTRL_R_OPTS="--reverse"
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_ALT_C_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"

# Want a hot key and go to any directory from wherever I am
# cf - fuzzy cd from anywhere
# ex: cf word1 word2 ... (even part of a file name)
# zsh autoload function
cf() {
  local file
  file="$(locate -Ai -0 $@ | grep -z -vE '~$' | fzf --read0 -0 -1)"
  if [[ -n $file ]]
  then
     if [[ -d $file ]]
     then
        cd -- $file
     else
        cd -- ${file:h}
     fi
  fi
}

# - The first argument to the function ($1) is the base path to start traversal 
# - See the source code (completion.{bash,zsh}) for the details. 
_fzf_compgen_path() { 
	fd --hidden --follow --exclude ".git" . "$1" 
} 

# Use fd to generate the list for directory completion 
_fzf_compgen_dir() { 
	fd --type d -p --hidden --follow --exclude ".git" . "$1" 
}

# bindkey '^B' __fzf_generic_path_completion
bindkey -s '^Q' "exit\n"
bindkey '^B' fzf-cd-widget
bindkey '^F' fzf-file-widget
#}}}

# zprof
