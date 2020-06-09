# Mendeley Colors




When using KDE with a dark theme the colors gets unusable in Mendeley. 

**Source [askubuntu](https://askubuntu.com/questions/660529/force-mendeley-desktop-gtk-theme/1098419#1098419)**
1. create an empty folder, e.g.  `mkdir $HOME/.config.theme_override`
2. symlink your Mendeley config to the new folder: `ln -s "$HOME/.config.theme_override/Mendeley Ltd." "$HOME/.config/Mendeley Ltd."`
3. start mendeleydesktop from the command line using: `XDG_CONFIG_HOME="$HOME/.config.theme_override"` mendeleydesktop


The step above are automated in the script `./fix_script`. Simply run the command to implement:

```bash
# Run in the current folder
./fix_script
# or
$HOME/.files/misc/Mendeley/fix_script
```



