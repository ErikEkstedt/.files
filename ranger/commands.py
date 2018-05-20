# This is a sample commands.py.  You can add your own commands here.
#
# Please refer to commands_full.py for all the default commands and a complete
# documentation.  Do NOT add them all here, or you may end up with defunct
# commands when upgrading ranger.

# You always need to import ranger.api.commands here to get the Command class:
from ranger.api.commands import *

# A simple command for demonstration purposes follows.
#------------------------------------------------------------------------------

# You can import any python module as needed.
import os

# Any class that is a subclass of "Command" will be integrated into ranger as a
# command.  Try typing ":my_edit<ENTER>" in ranger!
class my_edit(Command):
    # The so-called doc-string of the class will be visible in the built-in
    # help that is accessible by typing "?c" inside ranger.
    """:my_edit <filename>
    A sample command for demonstration purposes that opens a file in an editor.
    """
    # The execute method is called when you run this command in ranger.
    def execute(self):
        # self.arg(1) is the first (space-separated) argument to the function.
        # This way you can write ":my_edit somefilename<ENTER>".
        if self.arg(1):
            # self.rest(1) contains self.arg(1) and everything that follows
            target_filename = self.rest(1)
        else:
            # self.fm is a ranger.core.filemanager.FileManager object and gives
            # you access to internals of ranger.
            # self.fm.thisfile is a ranger.container.file.File object and is a
            # reference to the currently selected file.
            target_filename = self.fm.thisfile.path

        # This is a generic function to print text in ranger.
        self.fm.notify("Let's edit the file " + target_filename + "!")

        # Using bad=True in fm.notify allows you to print error messages:
        if not os.path.exists(target_filename):
            self.fm.notify("The given file does not exist!", bad=True)
            return

        # This executes a function from ranger.core.acitons, a module with a
        # variety of subroutines that can help you construct commands.
        # Check out the source, or run "pydoc ranger.core.actions" for a list.
        self.fm.edit_file(target_filename)

    # The tab method is called when you press tab, and should return a list of
    # suggestions that the user will tab through.
    def tab(self):
        # This is a generic tab-completion function that iterates through the
        # content of the current directory.
        return self._tab_directory_content()

class git_add_commit_push(Command):
    """
    :mkcd <dirname>
    Creates a directory with the name <dirname> and enters it.
    """
    def execute(self):
        from os.path import join, expanduser, lexists
        from os import makedirs
        import re
        commit_msg = expanduser(self.rest(1))
        if commit_msg is not None:
            command = "git add . ; git commit -m \"" + commit_msg + "\"; git push"
            self.fm.execute_command("git add .")
            self.fm.execute_command("git commit -m" + command)
            self.fm.execute_command("git push")
        else:
            self.fm.notify("Commit message required!", bad=True)


class fzf_select(Command):
    """
    :fzf_select
    Find a file using fzf and fd.
    With a prefix argument select only directories.
    See:
        https://github.com/junegunn/fzf
        https://github.com/sharkdp/fd.git
    """
    def execute(self):
        import subprocess
        import os.path
        if self.quantifier:
            # match only directories
            command="fd --type d --hidden --no-ignore | fzf +m -i"
        else:
            # match files and directories
            command="fd --hidden --follow --no-ignore --exclude .git | fzf +m -i"
        fzf = self.fm.execute_command(command, stdout=subprocess.PIPE)
        stdout, stderr = fzf.communicate()
        if fzf.returncode == 0:
            fzf_file = os.path.abspath(stdout.decode('utf-8').rstrip('\n'))
            if os.path.isdir(fzf_file):
                self.fm.cd(fzf_file)
            else:
                self.fm.select_file(fzf_file)


class fzf_cd_or_vim(Command):
    """
    :fzf_select
    Find a file using fzf and fd.
    With a prefix argument select only directories.
    See:
        https://github.com/junegunn/fzf
        https://github.com/sharkdp/fd.git
    """
    def execute(self):
        import subprocess
        import os.path
        if self.quantifier:
            # match only directories
            command="fd --type d --hidden --no-ignore | fzf-tmux -d 50% +m -i"
        else:
            # match files and directories
            command="fd --hidden --follow --no-ignore --exclude .git | fzf-tmux -d 50% +m -i"
        fzf = self.fm.execute_command(command, stdout=subprocess.PIPE)
        stdout, stderr = fzf.communicate()
        if fzf.returncode == 0:
            fzf_file = os.path.abspath(stdout.decode('utf-8').rstrip('\n'))
            if os.path.isdir(fzf_file):
                self.fm.cd(fzf_file)
            else:
                subprocess.call(["vim", fzf_file])


class fzf_cd(Command):
    """
    :fzf_select
    Find a file using fzf and fd.
    With a prefix argument select only directories.
    See:
        https://github.com/junegunn/fzf
        https://github.com/sharkdp/fd.git
    """
    def execute(self):
        import subprocess
        import os.path
        cwd = os.path.curdir
        os.chdir('/home/erik')
        command="fd --type d --hidden --follow --no-ignore --exclude .git | fzf +m -i"
        fzf = self.fm.execute_command(command, stdout=subprocess.PIPE)
        stdout, stderr = fzf.communicate()
        if fzf.returncode == 0:
            fzf_file = os.path.abspath(stdout.decode('utf-8').rstrip('\n'))
            if os.path.isdir(fzf_file):
                self.fm.cd(fzf_file)
            else:
                self.fm.select_file(fzf_file)

class fzf_cd_from_here(Command):
    """
    :fzf_select
    Find a file using fzf and fd.
    With a prefix argument select only directories.
    See:
        https://github.com/junegunn/fzf
        https://github.com/sharkdp/fd.git
    """
    def execute(self):
        import subprocess
        import os.path
        cwd = os.path.curdir
        command="fd --type d --hidden --follow --no-ignore --exclude .git | fzf +m -i"
        fzf = self.fm.execute_command(command, stdout=subprocess.PIPE)
        stdout, stderr = fzf.communicate()
        if fzf.returncode == 0:
            fzf_file = os.path.abspath(stdout.decode('utf-8').rstrip('\n'))
            if os.path.isdir(fzf_file):
                self.fm.cd(fzf_file)
            else:
                self.fm.select_file(fzf_file)

