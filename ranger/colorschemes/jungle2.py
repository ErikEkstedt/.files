# This file is part of ranger, the console file manager.
# License: GNU GPL version 3, see the file "AUTHORS" for details.

from ranger.gui.color import *
from ranger.colorschemes.default import Default

class Scheme(Default):
    progress_bar_color = red
    def use(self, context):
        fg, bg, attr = Default.use(self, context)

        if context.directory and not context.marked and not context.link:
            fg = red

        if context.in_titlebar and context.hostname:
            fg = red if context.bad else red

        return fg, bg, attr
