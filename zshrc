#======== Export Variables ===========
export ZSH=/home/erik/.oh-my-zsh
export KEYTIMEOUT=1
#export TERM="screen-256color"
#export TERM="xterm-256color"
export EDITOR='vim'
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR
export ROBOSCHOOL_PATH=/home/erik/roboschool
export LANG=en_US.UTF-8
export PATH="/home/erik/anaconda3/bin:$PATH"

stty -ixon # C-s, C-q 


#==== Base 16 =====
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"


#==== FZF =====
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


#==== ZSH Themes ========
#ZSH_THEME="terminalparty"
ZSH_THEME="spaceship"


# if you do a 'rm *', Zsh will give you a sanity check!
setopt RM_STAR_WAIT
setopt interactivecomments #allows to type Bash style comments in the command line
plugins=(gitfast python git-extras tmux vi-mode pip)

#====== Source =========
source $ZSH/oh-my-zsh.sh
source ~/.files/aliases
source "/home/erik/.oh-my-zsh/custom/themes/spaceship.zsh-theme"

HYPHEN_INSENSITIVE="true"

#========= TMUX on start ==============
if [ "$TMUX" = "" ]; then tmux new ; fi

##### WAL ########
# Import colorscheme from 'wal'
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
# (wal -r &)

source /opt/ros/kinetic/setup.zsh
