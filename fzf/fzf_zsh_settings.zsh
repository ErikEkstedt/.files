# FZF Settings 
#
# No need to let fzf installer put commands in zshrc file
# This script is sourced from $HOME/.files/zsh/zshrc -> $HOME/.zshrc

# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*" --glob "!node_modules/*" --glob "!vendor/*" 2> /dev/null'

export FZF_DEFAULT_COMMAND='fd'
export FZF_DEFAULT_OPTS="--height 80% --reverse "
export FZF_CTRL_T_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*" --glob "!node_modules/*" --glob "!vendor/*" 2> /dev/null'
export FZF_CTRL_T_OPTS="--preview 'bat --color always {}'"
export FZF_ALT_C_COMMAND='fd --type d --hidden --no-ignore --exclude .git'
export FZF_ALT_C_OPTS="--preview 'tree -L 1 -C {} | head -200' "
export FZF_CTRL_R_OPTS="--reverse"
export FZF_COMPLETION_OPTS='+c -x'

# ALT-C - cd into the selected directory
fzf-cd-custom-widget() {
    if [[ -z "$0" ]]; then
        echo "startPath '.'"
        startPath=.
    else;
        echo "startPath $1 "
        startPath=$1
    fi
    local cmd="${FZF_ALT_C_COMMAND:-"command find -L $startPath -mindepth 1 \\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune \
    -o -type d -print 2> /dev/null | cut -b3-"}"
    setopt localoptions pipefail no_aliases 2> /dev/null
    local dir="$(eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse $FZF_DEFAULT_OPTS $FZF_ALT_C_OPTS" $(__fzfcmd) +m)"
    if [[ -z "$dir" ]]; then
    zle redisplay
    return 0
    fi
    cd "$dir"
    unset dir # ensure this doesn't end up appearing in prompt expansion
    local ret=$?
    zle fzf-redraw-prompt
    return $ret
}
zle -N fzf-cd-custom-widget


# Functions
cd-from-home() { #{{{
    local current_dir=$(pwd); cd
    setopt localoptions pipefail 2> /dev/null
    local dir="$(eval "${FZF_ALT_C_COMMAND}" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse $FZF_DEFAULT_OPTS $FZF_ALT_C_OPTS" $(__fzfcmd) +m)"

    if [[ -z "$dir" ]]; then
        cd $current_dir
    zle redisplay
    return 0
    fi

    cd "$dir"
    local ret=$?
    zle fzf-redraw-prompt
    return $ret
}
zle -N cd-from-home
#}}}

cd-from-root() {
    local current_dir=$(pwd); cd /
    setopt localoptions pipefail 2> /dev/null
    local dir="$(eval "${FZF_ALT_C_COMMAND}" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse $FZF_DEFAULT_OPTS $FZF_ALT_C_OPTS" $(__fzfcmd) +m)"

    if [[ -z "$dir" ]]; then
        cd $current_dir
    zle redisplay
    return 0
    fi

    cd "$dir"
    local ret=$?
    zle fzf-redraw-prompt
    return $ret
}
zle -N cd-from-root

_fzf_compgen_path() { #{{{
    fd --hidden --follow --exclude ".git" . "$1" 
    # - The first argument to the function ($1) is the base path to start traversal 
    # - See the source code (completion.{bash,zsh}) for the details. 
} # }}}

_fzf_compgen_dir() { #{{{
    fd --type d -p --hidden --follow --exclude ".git" . "$1" 
}# }}}

# Find Files

home-files() {
    setopt localoptions pipefail 2> /dev/null
    eval "${FZF_CTRL_T_COMMAND} ~" | fzf | while read item; do
    echo -n "${(q)item} "
    done
    local ret=$?
    echo
    return $ret
}

files-from-home() {
    LBUFFER="${LBUFFER}$(home-files)"
    local ret=$?
    zle reset-prompt
    return $ret
}
zle -N files-from-home

fzf_tmux_kill_sessions() {
    # TODO
    # Extend to multiple choices
    local tsess="$(tmux list-sessions)"
    echo $tsess | fzf --reverse -m --prompt 'kill session: ' -1 \
        | cut -d':' -f1 \
        | xargs tmux kill-session -t
}

# WIP
# root-files() {
#   local cmd="rg --files --hidden"
#   setopt localoptions pipefail 2> /dev/null 
#   eval "$cmd $1" | fzf "$@"| while read item; do
#     echo -n "${(q)item} "
#   done
#   local ret=$?
#   echo
#   return $ret
# }

# files-from-root() {
#   LBUFFER="${LBUFFER}$(root-files /)"
#   local ret=$?
#   zle reset-prompt
#   return $ret
# }
# zle -N files-from-root


# fkill - kill processes - list only the ones you can kill.
fkill() {
    local pid
    if [ "$UID" != "0" ]; then
        pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
    else
        pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
    fi
    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
    fi
}

# Bindings
# bindkey '^u' files-from-root
# bindkey '^t' fzf-file-widget

bindkey '^t' files-from-home
bindkey '^f' fzf-file-widget
bindkey '^B' cd-from-home
bindkey '^O' fzf-cd-widget
bindkey '^_' cd-from-root               # key: CTRL - / 
bindkey -M vicmd f files-from-home
bindkey -M vicmd g cd-from-home
bindkey -M vicmd '^B' cd-from-home
bindkey -M vicmd '^O' fzf-cd-widget
bindkey -M vicmd '^_' cd-from-root
