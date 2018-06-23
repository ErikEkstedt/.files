#!/bin/bash

mkdir -p ~/Tiling && cd ~/Tiling

#########################
# faho - kwin-tiling
#########################
git clone https://github.com/faho/kwin-tiling.git
cd kwin-tiling/
plasmapkg2 --type kwinscript -i .

# If no config available in (systemsettings->window management->KWin Scripts->GUI_BUTTON)
mkdir -p ~/.local/share/kservices5
cp ~/.local/share/kwin/scripts/kwin-script-tiling/metadata.desktop ~/.local/share/kservices5/kwin-script-tiling.desktop

# In ~/.local/share/kwin/scripts/kwin-script-tiling/contents/code/tilelist.js, line 49
# Add xprop WM_CLASS second entry in this.blacklist. No spaces.
# this.blacklist = "systemsettings,yakuake,krunner,plasma,plasma-desktop,plugin-container,Wine,klipper,plasmashell,Plasma,ksmserver, pinentry".split(",");

#########################
# faho - kwin-tiling
#########################
cd ~/Tiling
git clone https://github.com/Jazqa/kwin-quarter-tiling.git
