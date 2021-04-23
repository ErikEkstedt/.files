# Conda

# Source function b/c Slow LOADING TIME 
# but I do require conda
function source_conda() {
  # >>> conda initialize >>> {{{
  # conda config --set changeps1 False  # show pre-prompt (base) etc
  __conda_setup="$( $HOME'/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then eval "$__conda_setup"; fi
  unset __conda_setup
  # <<< conda initialize <<< }}}
}

# source envs with fzf
function so() {
  local env
  source_conda
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
