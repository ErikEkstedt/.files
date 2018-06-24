# Bin

Executable files commonly used. 

This folder, `$HOME/.files/bin`, is appended to $PATH and meant to be globally used in my workflow.


* [chrome-calendar.desktop](./chrome-calendar.desktop): Desktop launcher for google calendar.
* [git-script](./git-script): script to git pull/status/push in all relevant repos.
* [nvim-tmux.desktop](): Desktop launcher for Nvim. Starts in $HOME.
  * [nvim-tmux.sh](): Starts konsole and executes nvim.
* [Oni.desktop](): Launch Oni such that it gets the correct paths. `:CheckHealth` should all pass.
  * [oni-launcher](./oni-launcher.sh)
* [project-init.py](./project-init.py): New project. Create folder and subfolders. not really usefull (yet or perhaps always).
* [ranger-tmux.desktop](./ranger-tmux.desktop): Ranger desktop launcher
  * [ranger-tmux.sh](./ranger-tmux.sh)
* [tmux-kill-detached-sessions ](./tmux-kill-detached-sessions): Show current sessions and kill all detached.
* [work.sh*](): Launch a new terminal window and apply tmuxinator WORK
