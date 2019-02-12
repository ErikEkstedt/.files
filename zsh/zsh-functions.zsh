# vim: fdm=marker
# zsh-functions.zsh
# sourced from zshrc


# Misc
################################################################

function price() { # {{{
  local pair="${1:-etheur}" # default pair
  local exchange="${2:-kraken}" # default exchange
  price=$(curl -s "https://api.cryptowat.ch/markets/$exchange/$pair/price" | jq ".result.price")
  echo "$pair: $price"
} #}}}

function g() {  #{{{
	la | grep -i $1
} #}}}

function print_path() {  #{{{
	for p in $path; do
		echo "$p"
	done
} #}}}

function cfg() { #{{{
  '''Open vim from everywhere at ~/.files directory'''
	current_dir=$(pwd)
	cd ~/.files
	vim $(fzf)
} #}}}

# Conda/python/jupyter
################################################################

function so() { #{{{
  local env
  if [ -z "$1" ]; then
    env=$(ls $HOME/miniconda3/envs | fzf)
    # source activate "$1"
  else
    env=$1
  fi
  conda activate "$env"
} 
alias sod="conda deactivate"
zle -N so
#}}}

# This is just an alias...
function junb() { #{{{
	jupyter notebook "$1"
} #}}}

# OS
case Linux in
  Darwin)
    # commands for OS X go here
    source ~/.files/zsh/zsh-functions-mac.zsh
    ;;
  Linux)
    # commands for Linux go here
    source ~/.files/zsh/zsh-functions-kde.zsh
    ;;
esac

# BINDINGS
################################################################

bindkey -s '^S' '^Asudo ^E'
# bindkey -s '^Q' "exit\r"
bindkey -s '^Q' 'tmux switch-client -n \; kill-session -t "$(tmux display-message -p "#S")" || tmux kill-session\r'
bindkey -M vicmd H beginning-of-line
bindkey -M vicmd L end-of-line
