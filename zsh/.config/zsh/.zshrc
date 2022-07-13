# vim: ft=zsh
# some useful options (man zshoptions)
# https://github.com/wincent/wincent/blob/fe798113ffb7c616cb7c332c91eaffd62e781048/roles/dotfiles/files/.zshrc#L43-L123

# Options
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

# Plugins
# export LANG="en_US.UTF-8" # set in .zprofile
source $ZDOTDIR/plugin-functions.zsh # functions for handling zsh plugins
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "zsh-users/zsh-autosuggestions"

# Completions
# This seems like a good resource: https://thevaluable.dev/zsh-completion-guide-examples/
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Highlight the current autocomplete option
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# Highlights the common pattern from the completion query
# zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==34=34}:${(s.:.)LS_COLORS}")';

zmodload zsh/complist
_comp_options+=(globdots)		# Include hidden files.

# Initialize the autocompletion
autoload -Uz compinit && compinit -i


# History
HISTFILE=$ZDOTDIR/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000


# Source
source $ZDOTDIR/alias.zsh  
source $ZDOTDIR/conda.zsh  # conda source
source $ZDOTDIR/functions.zsh  # random functions
source $ZDOTDIR/less-colors.zsh   # coloring for less pager
source $ZDOTDIR/ls-commands.zsh  # use ls or lcd + their aliases
source $ZDOTDIR/prompt.zsh
source $ZDOTDIR/vim-mode.zsh  # vim-mode, keytimeout & cursor styles
export TMUXDOTDIR=$HOME/.config/tmux

if [[ -f ~/.fzf.zsh  ]]; then
    source ~/.fzf.zsh
    source ~/.files/fzf/fzf_zsh_settings.zsh
fi

# TMUX  {{{
if [ "$TMUX" = "" ]; then
  if tmux has-session -t=Terminal 2> /dev/null; then
    tmux attach -t Terminal
  else
    tmux new-session -s Terminal
  fi
fi # }}}


# Exports
export DOTFILES=$HOME/.files
export COLORTERM="truecolor"
export EDITOR='nvim'
export BROWSER="brave-browser"
export MANPAGER='nvim +Man!'

# Path
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="$HOME/gems/bin:$PATH"  # Install Ruby Gems to ~/gems
export PATH="$HOME/go/bin:$PATH"                                   
export PATH="$HOME/Applications:$PATH"                                   
export PATH="$HOME/.npm-global/bin:$PATH"                                   
export PATH="$HOME/.rbenv/shims:$PATH"

export GEM_HOME="$HOME/gems"

# initialize rbenv
# eval "$(rbenv init - zsh)"

if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# Slow startup time but necessary
source_conda  # see conda.zsh
