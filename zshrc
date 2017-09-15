# If you come from bash you might have to change your $PATH.
#export PATH=/home/erik/bin:/usr/local/bin:/home/erik/.local/bin:/usr/local/sbin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
# Path to your oh-my-zsh installation.
#export PATH=/home/erik/anaconda3/bin:/home/erik/bin:/home/erik/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin

#so as not to be disturbed by Ctrl-S ctrl-Q in terminals:
stty -ixon

# Export Variables
export ZSH=/home/erik/.oh-my-zsh
export KEYTIMEOUT=1
export TERM="xterm-256color"
export EDITOR='vim'
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR
export ROBOSCHOOL_PATH=/home/erik/roboschool

# added by Anaconda3 4.2.0 installer
export PATH="/home/erik/anaconda3/bin:$PATH"

# ZSH Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="terminalparty"

# if you do a 'rm *', Zsh will give you a sanity check!
setopt RM_STAR_WAIT
setopt interactivecomments #allows to type Bash style comments in the command line
plugins=(gitfast python git-extras tmux vi-mode pip)
source $ZSH/oh-my-zsh.sh

# Aliases
# Screen
alias lock="gnome-screensaver-command -l"
alias bget="xrandr --verbose | grep -m 1 -i brightness | cut -f2 -d ' '"
alias b1="xrandr --output eDP-1 --brightness 0.1"
alias b2="xrandr --output eDP-1 --brightness 0.2"
alias b3="xrandr --output eDP-1 --brightness 0.3 "
alias b4="xrandr --output eDP-1 --brightness 0.4 "
alias b5="xrandr --output eDP-1 --brightness 0.5 "
alias b6="xrandr --output eDP-1 --brightness 0.6 "
alias b7="xrandr --output eDP-1 --brightness 0.7 "
alias b8="xrandr --output eDP-1 --brightness 0.8 "
alias b9="xrandr --output eDP-1 --brightness 1.0"
alias bmax="xrandr --output eDP-1 --brightness 1.3"

alias b_low="echo 100>/sys/class/backlight/intel_backlight/brightness"
alias b_mid="echo 500>/sys/class/backlight/intel_backlight/brightness"
alias b_max="echo 937>/sys/class/backlight/intel_backlight/brightness"

alias multscreen="xrandr --output eDP-1 --auto --output HDMI-2 --auto --above eDP-1; feh --bg-scale ~/.config/wall.png "
alias onescreen="xrandr --output eDP-1 --auto --output HDMI-2 --off; feh --bg-scale ~/.config/wall.png"

# Terminal stuff
alias tmux="TERM=xterm-256color /usr/bin/tmux"
#alias tmux="TERM=screen-256color-bce tmux"
#alias tmux='tmux -2'
alias ru="xrdb ~/.Xresources"

# Mount Usb Stick
#alias mountusb="sudo mount -t vfat /dev/sdb1 /media/usb_stick -o uid=1000,gid=1000,utf8,dmask=027,fmask=137 ; cd /media/usb_stick; ls"
alias umountusb="udiskie-umount /media/erik/*"

# LATEX
function ntex() {
    if [ -n "$1" ]; then
        cp ~/Documents/latex/LaTeX/Article_Base.tex ~/Documents/latex/"$1".tex
        cd ~/Documents/latex
        vim "$1".tex
    else     
        echo No name given...
    fi
}

function tnote() {
    if [ -n "$1" ]; then
        cp ~/Documents/latex/LaTeX/Notes_base.tex ~/Documents/latex/Notes_"$1".tex
        cd ~/Documents/latex
        vim Notes_"$1".tex
    else     
        echo No name given...
    fi
}

alias tma="cd ~/Documents/latex; vim Master.tex"
alias two="cd ~/Documents/latex; vim Master_todo.tex"
alias tco="cd ~/Documents/latex; vim Computer_todo.tex"

# Minecraft Malmo launcher
alias minecraft="sh ~/Malmo/Minecraft/launchClient.sh"

#source .oh-my-zsh/lib/alias.zsh
alias e="exit"
alias ls="ls --color=auto"
alias la="ls -A"
alias ll="ls -l"
alias lrt="ls -lrt"
alias ltt="ls -ogl *.tex"
alias lt="ls *.tex"
alias lpy="ls *.py"
alias lpdf="ls -ogl *.pdf"

# Programs
alias tlist="tmux list-sessions"
alias tk="tmux kill-session -t ."
alias tka="tmux kill-session -a"
alias tst="tmux new-session"

alias caps="sh ~/.files/start_up.sh"
alias nwp="variety -n"
alias ip="ipython"
alias news="newsbeuter"

alias cd..="cd .."

# Config files 
alias ev="vim ~/.vimrc"
alias evtex="vim ~/.vim/ftplugin/tex.vim"
alias evTA="vim ~/Documents/latex/LaTeX/Article_Base.tex"
alias evpython="vim ~/.vim/ftplugin/python.vim"

alias ebib="vim ~/Documents/latex/References.bib"
alias ez="vim ~/.zshrc"
alias rz="source ~/.zshrc"

alias et="vim ~/.tmux.conf"
alias eb="vim ~/.bashrc"
alias er="vim ~/.config/ranger/rc.conf"
alias ei3="vim ~/.config/i3/config"
alias eza="vim ~/.config/zathura/zathurarc"
alias eterm="vim ~/.Xresources"
alias eco="vim ~/.config/.compton.conf"

# Environments
alias py35="source activate python3.5"

# Movement
alias gbu="cd ~/.vim/bundle; ls"
alias gco="cd ~/com_sci"
alias gro="cd ~/roboschool"
alias gho="cd ~/"
alias gma="cd ~/com_sci/Master_code; ls"
alias gml="cd ~/com_sci/ML; ls"
alias gne="cd ~/com_sci/Nexus; ls"
alias gl="cd ~/Documents/latex; ls *.tex"
alias gpa="cd ~/Documents/Papers; ls *.pdf"
alias gdd="cd ~/Desktop/DATA; ls"
alias gdw="cd ~/Downloads; la"
alias ggit="cd ~/git-clones; ls"

# SSH % Wakeonlan
alias wake="wakeonlan -i 213.113.208.169 38:d5:47:14:d3:a1" 
alias mountdesk="sshfs -p 2002 -o ssh_command='ssh -i /home/erik/.ssh//id_rsa' erik@213.113.208.169:/home/erik/ /home/erik/Desktop"
alias umountdesk="sudo umount /home/erik/Desktop"

HYPHEN_INSENSITIVE="true"
# start tmux session when terminal starts
if [ "$TMUX" = "" ]; then tmux new ; fi