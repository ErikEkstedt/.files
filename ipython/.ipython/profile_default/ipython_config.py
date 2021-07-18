# Configuration file for ipython.
# see https://ipython.readthedocs.io/en/stable/config/intro.html
# for more info

## Autoindent IPython code entered interactively.
c.InteractiveShell.autoindent = True

## Use colors for displaying information about objects. Because this information
#  is passed through a pager (like 'less'), and some pagers get confused with
#  color codes, this capability can be turned off.
c.InteractiveShell.color_info = True

## Shortcut style to use at the prompt. 'vi' or 'emacs'.
c.TerminalInteractiveShell.editing_mode = "vi"

## Set the editor used by IPython (default to $EDITOR/vi/notepad).
c.TerminalInteractiveShell.editor = "nvim"

## Highlight matching brackets.
c.TerminalInteractiveShell.highlight_matching_brackets = True

## The name or class of a Pygments style to use for syntax highlighting. To see
#  available styles, run `pygmentize -L styles`.
c.TerminalInteractiveShell.highlighting_style = "monokai"

## Use 24bit colors instead of 256 colors in prompt highlighting. If your
#  terminal supports true color, the following command should print 'TRUECOLOR'
#  in orange: printf "\x1b[38;2;255;100;0mTRUECOLOR\x1b[0m\n"
c.TerminalInteractiveShell.true_color = True
