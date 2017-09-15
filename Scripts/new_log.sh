#/bin/bash
DATE=`date +%Y-%m-%d`
FILE=$DATE".tex"     
cd ~/Documents/latex/Logs/
if [ -f $FILE ]; then
    #File exists, open file
    DISPLAY=:0 notify-send -t 2000 --urgency=critical --icon=/usr/share/icons/gnome/256x256/status/user-available.png "Todays Log entry"

    vim $FILE
else
    # File does not exist, create file
    DISPLAY=:0 notify-send -t 2000 --urgency=critical --icon=/usr/share/icons/gnome/256x256/status/user-available.png "Todays Log entry"

    cp ~/Documents/latex/LaTeX/Log_base.tex ~/Documents/latex/Logs/"$FILE"
    vim $FILE
fi
