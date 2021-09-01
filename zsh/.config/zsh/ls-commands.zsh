# LS/LSD
if [ -x "$(command -v lsd)" ]; then # if lsd exists
    alias ls="lsd --group-dirs=first"
    alias ll="lsd -l --group-dirs=first"
    alias ld="lsd -1d */"
    alias lla="lsd -la --group-dirs=first"
    alias la="lsd -1a --group-dirs=first"
    alias t1="clear; lsd --tree --depth 1 --group-dirs first -I *pycache* -I runs* "
    alias t2="clear; lsd --tree --depth 2 --group-dirs first -I *pycache* -I runs* "
    alias t3="clear; lsd --tree --depth 3 --group-dirs first -I *pycache* -I runs* "
else
    if [[ $(uname) == 'Darwin' ]]; then
        alias ll="gls -l --color"
        alias ld="gls -ld */ --color"
        alias la="gls -A -1 --group-directories-first --color"
        alias lsf="gls -1 --group-directories-first --color"
        alias lrt="gls -lrt --color"
    else
        alias ll="ls -l --group-directories-first"
        alias ld="ls -ld */"
        alias la="ls -A -1 --group-directories-first"
        alias lla="ls -la --group-directories-first"
        alias lrt="ls -lrt"
    fi
fi
