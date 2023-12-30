# Configuration file for ipython.
# see https://ipython.readthedocs.io/en/stable/config/intro.html
# for more info
from IPython.terminal.prompts import Prompts, Token
from prompt_toolkit.enums import EditingMode

c = get_config()

## Autoindent IPython code entered interactively.
c.InteractiveShell.autoindent = True

## Use colors for displaying information about objects. Because this information
#  is passed through a pager (like 'less'), and some pagers get confused with
#  color codes, this capability can be turned off.
# c.InteractiveShell.color_info = True

## Shortcut style to use at the prompt. 'vi' or 'emacs'.
c.TerminalInteractiveShell.editing_mode = "vi"

## Set the editor used by IPython (default to $EDITOR/vi/notepad).
c.TerminalInteractiveShell.editor = "nvim"

## Highlight matching brackets.
c.TerminalInteractiveShell.highlight_matching_brackets = True

## The name or class of a Pygments style to use for syntax highlighting. To see
#  available styles, run `pygmentize -L styles`.
# c.TerminalInteractiveShell.colors = "neutral"
c.TerminalInteractiveShell.highlighting_style = "gruvbox-dark"

## Use 24bit colors instead of 256 colors in prompt highlighting. If your
#  terminal supports true color, the following command should print 'TRUECOLOR'
#  in orange: printf "\x1b[38;2;255;100;0mTRUECOLOR\x1b[0m\n"
c.TerminalInteractiveShell.true_color = True


class MyPrompt(Prompts):
    def vi_mode(self):
        if (
            getattr(self.shell.pt_app, "editing_mode", None) == EditingMode.VI
            and self.shell.prompt_includes_vi_mode
        ):
            mode = str(self.shell.pt_app.app.vi_state.input_mode)

            if mode.startswith("InputMode."):
                # mode = InputMode.INSERT / InputMode.NAVIGATION
                mode = mode[10]  # only first letter: I/N
            elif mode.startswith("vi-"):
                mode = mode[3:6]
            return "[" + mode + "]"
        return ""

    def is_insert_mode(self):
        if (
            getattr(self.shell.pt_app, "editing_mode", None) == EditingMode.VI
            and self.shell.prompt_includes_vi_mode
        ):
            mode = str(self.shell.pt_app.app.vi_state.input_mode)

            if not mode.startswith("InputMode.I"):
                return False
        return True

    def in_prompt_tokens(self):
        color = Token.PromptNum
        if not self.is_insert_mode():
            color = Token.OutPromptNum
        # return [
        #     (Token.PromptNum, str(self.shell.execution_count)),
        #     (Token.Prompt, " "),
        #     (Token.PromptNum, self.vi_mode()),
        #     (Token.PromptNum, ": "),
        # ]
        return [
            (color, str(self.shell.execution_count)),
            (color, ": "),
        ]

    def continuation_prompt_tokens(self, width=None):
        if width is None:
            width = self._width()

        color = Token.PromptNum
        if not self.is_insert_mode():
            color = Token.OutPromptNum
        return [
            (color, (" " * (width - 2)) + ": "),
        ]

    def out_prompt_tokens(self):
        return [
            (Token.OutPromptNum, str(self.shell.execution_count)),
            (Token.OutPromptNum, " " * (self._width() - 3) + ": "),
        ]


c.TerminalInteractiveShell.prompts_class = MyPrompt
c.TerminalInteractiveShell.highlighting_style_overrides = {
    Token.Prompt: "ansibrightblue"
}
