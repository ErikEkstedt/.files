# MAC

function firefox-window() { # {{{
/usr/bin/env osascript <<-EOF
tell application "System Events"
    if (name of processes) contains "Firefox" then
        tell application "Firefox" to activate
        keystroke "n" using command down
    else
        tell application "Firefox" to activate
    end if
end tell
EOF
}  # }}}
