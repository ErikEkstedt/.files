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
#====== Plugins ========{{{
#==== TMUX ====
if [ "$TMUX" = "" ]; then tmux new ; fi

#==== Base16 ==
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

#==== FZF =====
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

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
