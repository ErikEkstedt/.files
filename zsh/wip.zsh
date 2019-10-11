# -----------------------------------------------------------
# Change cursor shape for different vi modes.
# function zle-keymap-select {
#   if [[ ${KEYMAP} == vicmd ]] ||
#      [[ $1 = 'block' ]]; then
#     echo -ne '\e[1 q'
#   elif [[ ${KEYMAP} == main ]] ||
#        [[ ${KEYMAP} == viins ]] ||
#        [[ ${KEYMAP} = '' ]] ||
#        [[ $1 = 'beam' ]]; then
#     echo -ne '\e[5 q'
#   fi
# }
# zle -N zle-keymap-select
# zle-line-init() {
#     zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
#     echo -ne "\e[5 q"
# }
# zle -N zle-line-init

# echo -ne '\e[5 q' # Use beam shape cursor on startup.
# preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# ctrlz() {
#   if [[ $#BUFFER == 0 ]]; then
#     fg >/dev/null 2>&1 && zle redisplay
#   else
#     zle push-input
#   fi
# }
# zle -N ctrlz
# bindkey -s '^Z' ctrlz



# Tmux
#
#function start_tmux() {
#    if type tmux &> /dev/null; then
#        #if not inside a tmux session, and if no session is started, start a new session
#        if [[ -z "$TMUX" && -z $TERMINAL_CONTEXT ]]; then
#            (tmux -2 attach || tmux -2 new-session)
#        fi
#    fi
#}
#start_tmux


# ZSH-AUTOSUGGESTIONS
# I dont have a good key to accept completion
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# 
# bindkey '^ ' autosuggest-accept  # binds ctrl-space to accept
# export ZSH_AUTOSUGGEST_USE_ASYNC=true
# if [ -f .oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
# 	source .oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# fi
