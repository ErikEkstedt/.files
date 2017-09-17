#/bin/bash
DATE=`date +%Y-%m-%d`
FILE=$DATE".tex"     
Img=/usr/share/icons/gnome/256x256/apps/accessories-text-editor.png
cd ~/Documents/latex/Logs/
if [ -f $FILE ]; then
    #File exists, open file
    DISPLAY=:0 notify-send -t 2000 --urgency=critical --icon=$Img "Todays Log entry"

    vim $FILE
else
    # File does not exist, create file
    DISPLAY=:0 notify-send -t 2000 --urgency=critical --icon=$Img "Todays Log entry"

    cp ~/Documents/latex/LaTeX/Log_base.tex ~/Documents/latex/Logs/"$FILE"
    vim $FILE
fi
