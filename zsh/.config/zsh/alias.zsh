# Editing
alias ez="v ~/.files/zsh/.config/zsh/.zshrc"
alias htop="TERM=xterm htop"

# nvim
alias v="nvim"
alias vs="nvim -c 'SessionLoad'"
alias vf="nvim -c 'Telescope find_files hidden=true'"
alias vno="nvim -c 'Telescope find_files hidden=true cwd=~/zettelkasten'"

# Git
alias lg="lazygit"
alias gad="git add"
alias gco="git commit -m"
alias gdi="git diff"
alias gps="git push"
alias gpl="git pull"
alias gst="git status"
alias gch="git checkout --"
alias gpn="echo zettel;git -C ~/zettelkasten pull"
# alias gpn="echo zettel;git -C ~/zettelkasten pull;echo .files;git -C ~/.files pull"

# tree overwritten by lsd in ls-commands.zsh
alias t1='clear; tree -L 1 --dirsfirst -I "*pycache*|runs*"'
alias t2='clear; tree -L 2 --dirsfirst -I "*pycache*|runs*"'
alias t3='clear; tree -L 3 --dirsfirst -I "*pycache*|runs*"'

# Movement
alias gfi="cd ~/.files; t1; git status"
alias gv="cd ~/.files/nvim/.config/nvim; t1; git status"
alias gvi="cd ~/.files/nvim/.config/nvim; t1; git status ."
alias gdw="cd ~/Downloads; clear; ll"
alias gho="cd ~; clear; ll"
alias gpr="cd ~/projects; clear; ll"
alias ggr='cd "$(git rev-parse --show-toplevel)"; t1; git status'
alias gro="cd /; clear; ls"
alias gno="cd $HOME/zettelkasten"
alias gcl="cd $HOME/projects/CCConv/;t1"

# commands
alias cd..="cd .."
alias e="exit"
alias :q='exit'
alias :wq='exit'
alias rz="source ~/.zshrc"

# programs
alias ipy="ipython"  #--profile=erik"
alias wnvi="watch -n 1 nvidia-smi"
alias wnvi2="watch -n 1 nvidia-smi --query-gpu=index,memory.used,memory.total,power.draw --format=csv"
# browser. _browser_tab in functions.zsh
alias calendar="_browser_tab --app=https://calendar.google.com"
alias github="_browser_tab --new-tab https://github.com"
alias messenger="_browser_tab --new-tab https://messenger.com"

# Tmux
alias tls="tmux list-sessions"
alias tks="tmux kill-session -t"
alias trw="tmux rename-window"
alias trs="tmux rename -t . "
alias tkp="tmux kill-pane -t"
# alias tat=$DOTFILES/bin/tat  # Current path as new tmux session

# alias tspc="_tmux_send_keys_all_panes_"
# alias theme="_tmux_theme"


# COuld be useful to not forget about
# https://github.com/ssbc/patchwork
# alias patchwork="cd ~/patchwork && npm start"
alias rack='cd ~/Rack2Free && ./Rack'
# alias _diskspace="du -sk * | sort -nr | head -10"
# alias ducks='du -cks -- * | sort -rn | head'
# alias nvr="$HOME/miniconda3/envs/neovim3/bin/nvr"
# alias weather="curl wttr.in"
