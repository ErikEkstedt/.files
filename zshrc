# ========= SETTINGS ============
# ZSH ubuntu 16.04 - simple terminal
# Erik
# 2017
#====== Export ========={{{
export ZSH=/home/erik/.oh-my-zsh
export KEYTIMEOUT=1
#export TERM="screen-256color"
#export TERM="xterm-256color"
export TERMINAL="st"
export EDITOR='vim'
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

#====== Plugins ========{{{
#==== TMUX ====
if [ "$TMUX" = "" ]; then tmux new ; fi

#==== Base16 ==
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

#==== FZF =====
#
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--height 40% --reverse'
# export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude ".git"' 
export FZF_CTRL_R_OPTS="--reverse"

bindkey '^Q' exit
bindkey '^B' fzf-cd-widget
bindkey '^F' fzf-file-widget

# Todo: Function that binds a key to open a file in vim

# Use fd (https://github.com/sharkdp/fd) instead of the default find 
# command for listing path candidates. 
# - The first argument to
# the function ($1) is the base path to start traversal 
# - See the source code (completion.{bash,zsh}) for the details. 
#
_fzf_compgen_path() { 
	fd --hidden --follow --exclude ".git" . "$1" 
} 

# Use fd to generate the list for directory completion 
_fzf_compgen_dir() { 
	fd --type d --hidden --follow --exclude ".git" . "$1" 
}
