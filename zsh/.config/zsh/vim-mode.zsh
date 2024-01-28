# Vi mode
bindkey -v
export KEYTIMEOUT=1


# Movement
vi-cmd-up-line-history() {
  zle vi-cmd-mode
  zle up-line-or-history
}
zle -N vi-cmd-up-line-history

vi-cmd-down-line-history() {
  zle vi-cmd-mode
  zle down-line-or-history
}
zle -N vi-cmd-down-line-history


# otherwise the text written before vi-mode can't be deleted
bindkey -v '^?' backward-delete-char

# Use vim keys in tab complete menu:
bindkey -M menuselect '^h' vi-backward-char
bindkey -M menuselect '^k' vi-up-line-or-history
bindkey -M menuselect '^l' vi-forward-char
bindkey -M menuselect '^j' vi-down-line-or-history

# Movement
bindkey -M vicmd H beginning-of-line
bindkey -M vicmd L end-of-line
bindkey -M vicmd J vi-cmd-down-line-history
bindkey -M vicmd K vi-cmd-up-line-history

# Change cursor shape for different vi modes.
# Set cursor style (DECSCUSR), VT520.
# 0  ⇒  blinking block.
# 1  ⇒  blinking block (default).
# 2  ⇒  steady block.
# 3  ⇒  blinking underline.
# 4  ⇒  steady underline.
# 5  ⇒  blinking bar, xterm.
# 6  ⇒  steady bar, xterm.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[2 q';;      # block (non-blinking)
        viins|main) echo -ne '\e[6 q';; # beam (non-blinking)
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[6 q" # beam (non-blinking)
}
zle -N zle-line-init
preexec() { echo -ne '\e[6 q' ;} # Use beam (non-blinking) shape cursor for each new prompt.
