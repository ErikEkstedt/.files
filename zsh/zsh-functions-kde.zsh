# KDE

# Konsole
# Change colorscheme in Konsole from CLI.
# Note: this does not change colorscheme in tmux
# see .files/tmux/tmux_functions.zsh
function _konsole_theme() { #{{{
  local pre="$HOME/.files/terminals/konsole"
	local theme=$(ls $pre | grep .colorscheme | sed 's/\.[^.]*$//' | fzf)
  echo $theme
  local prefix='\033Ptmux;\033\033]50;%s\007\033\\'
  printf $prefix "colors=$theme"
}
zle -N _konsole_theme

# KDECONNECT
function sms() { #{{{
	kdeconnect-cli --send-sms "$1" \
	--destination 0762060648 \
	-n Samsung\ Galaxy\ Note\ 4
} #}}}

## Blurred transparency {{{
## https://www.reddit.com/r/kde/comments/6jzuwu/konsole_and_yakuake_blur/
# case `uname` in
#   Linux)
#     # commands for Linux go here
# 	if [[ $(ps --no-header -p $PPID -o comm | grep -Ev '^(yakuake|konsole)$' ) ]]; then
# 			for wid in $(xdotool search --pid $PPID); do
# 				xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id $wid; done
# 	fi
#   ;;
# esac
# # }}}
