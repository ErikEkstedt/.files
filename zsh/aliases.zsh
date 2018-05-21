# =================================================
# =================   ALIASES  ====================
# =================================================

# Terminal {{{
alias tmux="TERM=screen-256color-bce /usr/bin/tmux"
alias cd..="cd .."
alias e="exit"
alias :q='exit'
alias :wq='exit'
alias ls="ls --color=auto"
alias la="ls -A"
alias ll="ls -l"
alias ld="ls -ld */"
alias lrt="ls -lrt"
alias ltt="ls -ogl *.tex"
alias ltx="ls *.tex"
alias lpy="ls *.py"
alias lpdf="ls -ogl *.pdf"

# }}}

# Movement {{{

alias gp="cd ~/PhD; ls"
alias phd="PhD"

alias gfi="cd ~/.files; ls"
alias gma="cd ~/com_sci/Master_code; ls"
alias gpr="cd ~/com_sci/Master_code/Gestures/gesture; ls"
alias gro="cd ~/com_sci/Master_code/Robot/;ls"
alias gth="cd ~/Documents/latex/Notes/Thesis; ls *.tex"

alias gbu="cd ~/.vim/bundle; ls"
alias gdw="cd ~/Downloads; la"
alias gho="cd ~/"
alias gno="cd ~/Documents/latex/Notes; ls" 

alias gass="cd ~/com_sci/Ideas/assistant; ls"
alias gbull="cd ~/anaconda3/envs/bullet/lib/python3.5/site-packages/pybullet_envs"
alias gges="cd ~/anaconda3/envs/roboschool/lib/python3.5/site-packages/gesture"
alias ggs="cd ~/com_sci/Conversational-Systems-KTH"
alias gla="cd ~/Documents/latex; ls"
alias gmisc="cd ~/com_sci/misc/;ls"
alias gml="cd ~/com_sci/ML; ls"
alias gpa="cd ~/Documents/Papers; ls *.pdf"

# alias gnao="cd ~/anaconda3/envs/Naoqi/lib/python2.7/site-packages/pynaoqi-python2.7-2.5.5.5-linux64/lib/python2.7/site-packages"
# alias gcho="cd /opt/Aldebaran/Choregraphe\ Suite\ 2.5"

# }}}

# LATEX {{{
alias tlog="sh ~/.files/Scripts/new_log.sh " "$1"
alias tnew="sh ~/.files/Scripts/new_tex.sh " "$1"
alias tnote="sh ~/.files/Scripts/new_note.sh " "$1"

alias tma="cd ~/Documents/latex; vim Master.tex"
alias two="cd ~/Documents/latex; vim Master_todo.tex"
alias tco="cd ~/Documents/latex; vim Computer_todo.tex"
# }}}

# Nvim/ipython/dropdown/yakuake){{{
alias vim="nvim"
alias v="nvim"
alias ipy="ipython"  #--profile=erik"

alias drop="/home/erik/.files/Scripts/tmux/dropdown.sh"
function mkpr() { project_init "$1" } 
# }}}

# Git {{{
alias gad="git add"
alias gcm="git commit -m "
alias gps="git push"
alias gpl="git pull"
alias gst="git status"

alias gpush="python ~/.files/Scripts/auto_git.py push"
alias gpull="python ~/.files/Scripts/auto_git.py pull"
alias gstatus="python ~/.files/Scripts/auto_git.py status"
# }}}

# Tmux {{{
alias tls="tmux list-sessions"
alias tk="tmux kill-session -t ."
alias tkill="tmux kill-session -t"
alias tatt="tmux attach -t"
alias tkillall="tmux kill-session -a"
alias tst="tmux new-session"
# }}}

# Config {{{
alias eal="vim ~/.files/zsh/aliases.zsh"
alias ealiases="vim ~/.files/zsh/aliases.zsh"
alias ev="vim ~/.files/nvim/init.vim"
alias ez="vim ~/.zshrc"
alias ezl="vim ~/.files/zsh/zshrc-laptop"
alias ezd="vim ~/.files/zsh/zshrc-desktop"
alias et="vim ~/.tmux.conf"
alias er="vim ~/.config/ranger/rc.conf"

alias rz="source ~/.zshrc"
alias ru="xrdb -load ~/.Xresources"

# Mount Usb Stick
alias umountusb="udiskie-umount /media/erik/*"

# }}}

# SSH / WOL {{{
alias wake="wakeonlan -i 213.113.208.169 38:d5:47:14:d3:a1" 
alias sshhome="ssh erik@213.113.208.169"
alias mountdesk="sshfs -p 2002 -o ssh_command='ssh -i /home/erik/.ssh//id_rsa' erik@213.113.208.169:/home/erik/ /home/erik/Desktop-home"
alias umountdesk="sudo umount /home/erik/Desktop"
alias sshwork="ssh Erik@130.238.17.189"

# }}}
