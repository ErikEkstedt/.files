##################################################################
# Options
##################################################################
unsetopt BEEP
setopt autocd               # .. is shortcut for cd .. (etc)
setopt autoparamslash       # tab completing directory appends a slash
setopt autopushd            # cd automatically pushes old dir onto dir stack
setopt noflowcontrol        # disable start (C-s) and stop (C-q) characters
setopt nonomatch            # unmatched patterns are left unchanged
setopt ignoreeof            # prevent accidental C-d from exiting shell
setopt interactivecomments  # allow comments, even in interactive shells
setopt pushdignoredups      # don't push multiple copies of same dir onto stack
setopt pushdsilent          # don't print dir stack after pushing/popping
setopt extendedglob
setopt RM_STAR_WAIT  # if you do a 'rm *', Zsh will give you a sanity check!


zmodload zsh/zprof

# Detect the operating system
os_type="$(uname -s)"

##################################################################
# Plugins
##################################################################
# Using zap: https://github.com/zap-zsh/zap
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "mafredri/zsh-async"
# plug "jeffreytse/zsh-vi-mode"  -- maybe but not now

##################################################################
# Completions
##################################################################
# This seems like a good resource: https://thevaluable.dev/zsh-completion-guide-examples/
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# Highlight the current autocomplete option
# zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# Highlights the common pattern from the completion query
# zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==34=34}:${(s.:.)LS_COLORS}")';
zmodload zsh/complist
_comp_options+=(globdots)		# Include hidden files.
# Initialize the autocompletion
autoload -Uz compinit && compinit -i


##################################################################
# Exports
##################################################################
export ZSH="$HOME/.config/zsh"
export DOTFILES=$HOME/.files
export COLORTERM="truecolor"
export EDITOR='nvim'
export BROWSER="brave-browser"
export MANPAGER='nvim +Man!'
export PATH="$HOME/Applications:$PATH"

# History
HISTFILE=$ZSH/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

##################################################################
# Alias
##################################################################
nvimload() {
  nvim -c "lua require('persistence').load()"
}

alias v="nvim"
alias vs=nvimload
alias vf="nvim -c 'Telescope find_files hidden=true'"
alias vn="nvim -c 'ObsidianToday'"
alias lg="lazygit"
alias ipy="ipython"
alias wnvi="watch -n 1 nvidia-smi"
alias wnvi2="watch -n 1 nvidia-smi --query-gpu=index,memory.used,memory.total,power.draw --format=csv"

# Movement
alias gfi="$HOME/.files;ll"
alias gpr="$HOME/projects;ll"
alias gdw="$HOME/Downloads;ll"
alias gdo="$HOME/Documents;ll"
alias gco="$HOME/.config;ll"

# Git
alias gst="git status"
alias gch="git checkout --"
alias gpl="git pull"
alias gps="git push"
# alias gco="git commit -m"


# Colors LS_COLORS and EXA_COLORS
# Better ls-commands (assuming exa is installed)
if [ -x "$(command -v exa)" ]; then # if lsd exists
    alias ls="exa --icons --group-directories-first"
    alias ll="exa -l --icons --group-directories-first"
    alias la="exa -la --icons --group-directories-first"
    alias tree="exa -T --icons --group-directories-first"
    alias t1="exa -T --icons --group-directories-first -L 1"
    alias t2="exa -T --icons --group-directories-first -L 2"
else
  alias ls="ls --group-directories-first"
  alias ll="ls -l --group-directories-first"
  alias la="ls -A -1 --group-directories-first"
fi


##################################################################
# Tmux
##################################################################
export TMUXDOTDIR=$HOME/.config/tmux
if [ "$TMUX" = "" ]; then
  if tmux has-session -t=Terminal 2> /dev/null; then
    tmux attach -t Terminal
  else
    tmux new-session -s Terminal
  fi
fi # }}}

##################################################################
# Source files
##################################################################
# source $ZSH/prompt.zsh
source $ZSH/vim-mode.zsh  # vim-mode, keytimeout & cursor styles
if [ -f $HOME/.fzf.zsh ]; then
  source $HOME/.fzf.zsh
  source $ZSH/fzf.zsh
fi


##################################################################
#Conda
##################################################################
#!! Contents within this block are managed by 'conda init' !!
# Make sure you use double qutoes with $HOME
function source_conda() {
  __conda_setup="$("$HOME/miniconda3/bin/conda" 'shell.zsh' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
      eval "$__conda_setup"
  else
      if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
          . "$HOME/miniconda3/etc/profile.d/conda.sh"
      else
          export PATH="/Users/erik/miniconda3/bin:$PATH"
      fi
  fi
  unset __conda_setup
}
source_conda
# WARNING: if you use startship prompt don't use condas prompt info:
# `conda config --set changeps1 False`

# Conda is so slow to source!! we want to do it async
# This does not work...
# if [ -f "$ZAP_PLUGIN_DIR/zsh-async/async.zsh" ]; then
#   source "$ZAP_PLUGIN_DIR/zsh-async/async.zsh"
#   # function foo() { print hello }
#   function completed_callback() {
#     zle reset-prompt
#   }
#   async_init
#   async_start_worker my_worker -n
#   async_register_callback my_worker completed_callback
#   async_job my_worker source_conda
# fi

function so() {
  local env
  # source_conda
  if [ -z "$1" ]; then
    # The '\ls' is to avoid an alias
    env=$(\ls $HOME/miniconda3/envs | fzf)
    # source activate "$1"
  else
    env=$1
  fi
  conda activate "$env"
}
alias sod="conda deactivate"
zle -N so


##################################################################
# Functions
##################################################################
function g() {
    ls -a | grep -i $1
}


# Rust
export PATH="$HOME/.cargo/bin:$PATH"
export CARGO_HOME="$HOME/.cargo"


# FNM: Fast Node Manager
if [[ "$os_type" == "Darwin" ]]; then
  export PATH="$HOME/Library/Application Support/fnm:$PATH"
elif [[ "$os_type" == "Linux" ]]; then
  export PATH="/home/erik/.local/share/fnm:$PATH"
else
  echo "Unknown operating system."
fi
eval "`fnm env`"

# Starship fast, cross-shell, prompt
eval "$(starship init zsh)"
