# =================================================
# =================   ALIASES  ====================
# =================================================
# Standard {{{
alias cd..="cd .."
alias e="exit"
alias :q='exit'
alias :wq='exit'
# pneumonic: (l)ist(.)...
# alias la="ls -A"

if [[ $(uname) == 'Darwin' ]]; then
  alias ll="gls -l --color"
  alias ld="gls -ld */ --color"
  alias la="gls -A -1 --group-directories-first --color"
  alias lsf="gls -1 --group-directories-first --color"
  alias lrt="gls -lrt --color"
  alias ltt="gls -ogl *.tex --color"
  alias ltx="gls *.tex --color"
  alias lpy="gls *.py --color"
  alias lpdf="gls -ogl *.pdf --color"
else
    alias ll="ls -l --group-directories-first"
    alias ld="ls -ld */"
    alias la="ls -A -1 --group-directories-first"
    alias lla="ls -la --group-directories-first"
fi

if [ -x "$(command -v lsd)" ]; then # if lsd exists
  alias ls="lsd --group-dirs=first"
  alias ll="lsd -l --group-dirs=first"
  alias ld="lsd -1d */"
  alias lla="lsd -la --group-dirs=first"
  alias la="lsd -1a --group-dirs=first"
  alias ltr="lsd --tree --depth 2"
else
  alias La="tspc 'ls -A -1 --group-directories-first'"
  alias lrt="ls -lrt"
  alias ltt="ls -ogl *.tex"
  alias ltx="ls *.tex"
  alias lpy="ls *.py"
  alias lpdf="ls -ogl *.pdf"
fi

alias Ls="tspc ls"
alias ldt="tree -d -L 2"
# }}}

# Movement {{{
alias gfi="cd ~/.files; clear; ls"
alias gtu="cd ~/TurnTaking/turntaking; clear; ls"
alias gz="cd ~/.files/zsh; clear; ls"
alias gbl="cd ~/ErikEkstedt.github.io; ls"
alias gph="cd ~/phd; ls"
alias gpe="cd ~/.personal; ls"

alias gho="cd ~; clear; ls"
alias gdw="cd ~/Downloads; clear; la"
alias gpi="cd ~/Pictures"

alias cdallen="~/allennlp; ls"
alias goallen="~/allennlp; ls"
alias gallen="~/allennlp; ls"
# }}}

####################### 

# _vim_fzf(){
#   if [ $# -eq 0 ]
#   then
#     # echo "No arguments supplied"
#     nvim +FZF
#   else
    # echo $1
#     nvim "$1"
#   fi
# }

# Programming {{{
case `uname` in
  Darwin)
    ;;
  Linux)
    alias nvim="~/Applications/nvim"
    ;;
esac

alias v="nvim"
alias vf="nvim -c Files"
alias py="python"  #--profile=erik"
alias ipy="ipython"  #--profile=erik"
alias jno="jupyter notebook"  #jupyter notebook example.ipynb
alias wnvi="watch -n 1 nvidia-smi"
alias wnvi2="watch -n 1 nvidia-smi --query-gpu=index,memory.used,memory.total,power.draw --format=csv"

# Emacs binding
alias semacs="bindkey -e"
# alias scroll="xinput set-prop 12 284 -303 303" Some old laptop setting?
# alias wif="sudo iwconfig wlp2s0 txpower 10dBm"
# alias friture="python $HOME/friture/main.py"

# Mycroft
alias somy="source $HOME/mycroft-core/.venv/bin/activate"

# }}}

# Konsole
alias ktheme="_konsole_theme"

# Tmux {{{
alias titerm="tmux source ~/.files/tmux/tmux.iterm.conf"
alias tls="tmux list-sessions"

alias tkd=tmuxkillf
alias tks="tmux kill-session -t"
alias tkp="tmux kill-pane -t"
alias tkw="tmux kill-window -t"

alias tmux_sessions=$DOTFILES/tmuxinator/start_sessions.bash
alias tns=$DOTFILES/tmuxinator/tmuxinator-fzf-start.sh
alias tspc="_tmux_send_keys_all_panes_"
alias theme="_tmux_theme"
alias tat=$DOTFILES/bin/tat  # Current path as new tmux session

alias Clear='tspc "clear"'
# }}}

alias patchwork="cd ~/patchwork && npm start"

# tensorboard
alias tens="tensorboard --logdir "

# File Manager {{{
alias ranger=lf
alias fm=lf

# }}}

# if [[ $(hostname) == 'erik-Desktop' ]]; then
#   # Ranger
#   alias ran='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
#   alias r='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
# fi


# Git {{{
alias gad="git add"
alias gco="git commit -m"
alias gdi="git diff"
alias gps="git push"
alias gpl="git pull"
alias gst="git status"
alias gch="git checkout --"

# For all panes in window (tmux)
alias Gps='tspc "git push"'
alias Gpl='tspc "git pull"'
alias Gst='tspc "git status"'

alias gpush="python ~/.files/bin/git-script -c push -d .files phd Notes Audio/maptaskdataset Audio/dialogAgent Locomotion"
alias gpull="python ~/.files/bin/git-script -c pull -d .files phd Notes Audio/maptaskdataset Audio/dialogAgent Locomotion"      
alias gstatus="python ~/.files/bin/git-script -d .files phd Notes Audio/maptaskdataset Audio/dialogAgent Locomotion"
# }}}


# Config {{{
alias eal="nvim ~/.files/zsh/aliases.zsh"
alias ealiases="nvim ~/.files/zsh/aliases.zsh"
alias ev="nvim ~/.files/nvim/init.vim"
alias ez="nvim ~/.zshrc"
alias et="nvim ~/.tmux.conf"
alias er="nvim ~/.config/ranger/rc.conf"

alias rz="source ~/.zshrc"
alias ru="xrdb -load ~/.Xresources"

# Mount Usb Stick
alias umountusb="udiskie-umount /media/erik/*"

# }}}


# SSH / WOL {{{
export MOUNTPATH=~/LAN
alias wake="wakeonlan -i xxx.xxx.xxx.xxx yy:yy:yy:yy:yy:yy" 
alias mountmachine="sshfs -p 2002 -o ssh_command='ssh -i ~/.ssh//id_rsa' user@xxx.xxx.xxx.xxx:/PATH/ ~/$MOUNTPATH"
alias umountall="sudo umount ~/Machines/*"
# }}}

# MacbookPro linux {{{
# alias wake=
# }}}
