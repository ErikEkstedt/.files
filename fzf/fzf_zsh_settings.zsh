# FZF Settings 
#
#
# No need to let fzf installer put commands in zshrc file
# This script is sourced from $HOME/.files/zsh/zshrc -> $HOME/.zshrc
export FZF_DEFAULT_COMMAND='fd --color=always --type file --hidden'
export FZF_DEFAULT_OPTS="--height 100% --reverse --ansi"

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --color always {}'"

export FZF_ALT_C_COMMAND='fd --type d --hidden --follow -E .git/ -E node_modules/ --color=always'
export FZF_ALT_C_OPTS="--preview 'tree -L 1 -C {} | head -300' "

export FZF_CTRL_R_OPTS="--reverse"
export FZF_COMPLETION_OPTS='+c -x'

fzf-dir-change(){
    local cmd="$FZF_ALT_C_COMMAND . $1"  # fzf + 'catch-all pattern = .' + 'root'

    setopt localoptions pipefail no_aliases 2> /dev/null
    local dir="$(eval "$cmd" | FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS $FZF_ALT_C_OPTS" $(__fzfcmd) +m)"

    # If not a directory then go back to the current dir
    if [[ -z "$dir" ]]; then
      return 0
    fi

    cd "$dir"
    unset dir # ensure this doesn't end up appearing in prompt expansion
    local ret=$?
    zle reset-prompt  # redraw prompt to update CWD
    return $ret
}
fzf-dir-change-projects(){ fzf-dir-change $HOME/projects }
fzf-dir-change-home(){ fzf-dir-change $HOME }
fzf-dir-change-dot(){ fzf-dir-change $HOME/.files }
fzf-dir-change-cwd(){ fzf-dir-change . }
zle -N fzf-dir-change-projects
zle -N fzf-dir-change-home
zle -N fzf-dir-change-dot
zle -N fzf-dir-change-cwd

fzf_tmux_kill_sessions() {
    # TODO
    # Extend to multiple choices
    local tsess="$(tmux list-sessions)"
    echo $tsess | fzf --reverse -m --prompt 'kill session: ' -1 \
        | cut -d':' -f1 \
        | xargs tmux kill-session -t
}

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
bindkey '^P' fzf-dir-change-projects
bindkey '^B' fzf-dir-change-home
bindkey '^Y' fzf-dir-change-dot
bindkey '^O' fzf-dir-change-cwd
bindkey '^F' fzf-file-widget
bindkey -M vicmd '^P' fzf-dir-change-projects
bindkey -M vicmd '^B' fzf-dir-change-home
bindkey -M vicmd '^Y' fzf-dir-change-dot
bindkey -M vicmd '^O' fzf-dir-change-cwd
