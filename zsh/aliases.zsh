# ================================================ #
# =================  ALIASES  ==================== #
# ================================================ #
# Standard {{{
DOTFILES=$HOME/.files
alias cd..="cd .."
alias e="exit"
alias :q='exit'
alias :wq='exit'
alias rz="source ~/.zshrc"

alias _diskspace="du -sk * | sort -nr | head -10"
alias ducks='du -cks -- * | sort -rn | head'

# Source Emac binding
alias semacs="bindkey -e"

# LS
alias Ls="tspc ls"
alias ldt="tree -d -L 2"
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

# LSD
if [ -x "$(command -v lsd)" ]; then # if lsd exists
    alias ls="lsd --group-dirs=first"
    alias ll="lsd -l --group-dirs=first"
    alias ld="lsd -1d */"
    alias lla="lsd -la --group-dirs=first"
    alias la="lsd -1a --group-dirs=first"
    alias ltr="lsd --tree --depth 2"
    alias t1="clear; lsd --tree --depth 1 --group-dirs first"
    alias t2="clear; lsd --tree --depth 2 --group-dirs first"
    alias t3="clear; lsd --tree --depth 3 --group-dirs first"
else
    alias La="tspc 'ls -A -1 --group-directories-first'"
    alias lrt="ls -lrt"
    alias ltt="ls -ogl *.tex"
    alias ltx="ls *.tex"
    alias lpy="ls *.py"
    alias lpdf="ls -ogl *.pdf"
    alias t1="clear; tree -L 1 --dirsfirst"
    alias t2="clear; tree -L 2 --dirsfirst"
    alias t3="clear; tree -L 3 --dirsfirst"
fi
# }}}
# Movement {{{
alias gfi="cd ~/.files; clear; ls"
alias gtu="cd ~/TurnGPT; clear; ls"
alias gz="cd ~/.files/zsh; clear; ls"
alias gbl="cd ~/ErikEkstedt.github.io; ls"
alias gph="cd ~/phd; ls"
alias gpe="cd ~/.personal; ls"
alias gdw="cd ~/Downloads; clear; la"
alias gpi="cd ~/Pictures"

alias gho="cd ~; clear; ls"
alias gpr="cd $(git rev-parse --show-toplevel); clear; ls"
alias gro="cd /; clear; ls"
# }}}
# Edit configs {{{
alias eal="nvim ~/.files/zsh/aliases.zsh"
alias ealiases="nvim ~/.files/zsh/aliases.zsh"
alias ev="nvim ~/.files/nvim/init.vim"
alias ez="nvim ~/.zshrc"
alias et="nvim ~/.tmux.conf"
alias er="nvim ~/.config/ranger/rc.conf"
# alias ru="xrdb -load ~/.Xresources"
# Mount Usb Stick
alias umountusb="udiskie-umount /media/erik/*"
# }}}
# Programs {{{
alias tens="tensorboard --logdir "
alias patchwork="cd ~/patchwork && npm start"
alias rack='~/Rack/Rack'
alias z='zathura'
alias ts='/home/erik/TeamSpeak3-Client-linux_amd64/ts3client_runscript.sh'
alias somy="source $HOME/mycroft-core/.venv/bin/activate"
alias nvr="$HOME/miniconda3/envs/neovim3/bin/nvr"

case `uname` in
  Darwin)
    ;;
  Linux)
    # alias nvim="~/Applications/nvim"
    alias nvim="~/Applications/nvim.appimage"
    ;;
esac

alias v="nvim"
alias vn="nvim -c VimwikiIndex"
alias vf="nvim -c Files"
alias py="python"  #--profile=erik"
alias ipy="ipython"  #--profile=erik"
alias ipdb="python -m ipdb"
alias pdb="python -m pdb"
alias jno="jupyter notebook"  #jupyter notebook example.ipynb
alias wnvi="watch -n 1 nvidia-smi"
alias wnvi2="watch -n 1 nvidia-smi --query-gpu=index,memory.used,memory.total,power.draw --format=csv"
alias ktheme="_konsole_theme"
alias weather="curl wttr.in"
# TODO: make a function to start browser as separate process if session does not already exists
alias calendar="_browser_tab --app=https://calendar.google.com"
alias github="_browser_tab --new-tab https://github.com"
alias messenger="_browser_tab --new-tab https://messenger.com"
# }}}
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
# }}}
# Tmux {{{
alias titerm="tmux source ~/.files/tmux/tmux.iterm.conf"
alias tkd=tmuxkillf
alias tls="tmux list-sessions"
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
# File Manager {{{
alias lf=lfcd   # function in zshrc 
alias fm=lf
alias vif=$HOME/.config/vifm/scripts/vifmrun
# }}}
# SSH / WOL {{{
export MOUNTPATH=~/LAN
alias wake="wakeonlan -i xxx.xxx.xxx.xxx yy:yy:yy:yy:yy:yy"
alias mountmachine="sshfs -p 2002 -o ssh_command='ssh -i ~/.ssh//id_rsa' user@xxx.xxx.xxx.xxx:/PATH/ ~/$MOUNTPATH"
alias umountall="sudo umount ~/Machines/*"
# }}}
# vim: fdm=marker
