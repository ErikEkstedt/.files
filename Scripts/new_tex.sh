#!/bin/bash
# Creates a tex file with the name of the first argument passed to the script
# Uses a template

# Checks if any input was given
if [ -n "$1" ]; then
    FILE="$1"".tex"     
    echo $FILE
else     
    echo "No file name given."
    echo "Please give name:"
    echo "     sh new_tex.sh FILENAME"
    exit 1
fi

Img=/usr/share/icons/gnome/256x256/apps/accessories-text-editor.png
cd ~/Documents/latex/Misc/
# checks if file already exists
if [ -f $FILE ]; then
    #File exists, open file
    DISPLAY=:0 notify-send -t 2000 --urgency=critical --icon=$Img "File already exists. Open existing file."
    vim $FILE
else
    cp ~/Documents/latex/LaTeX/standard.tex ~/Documents/latex/Misc/"$1".tex

    DISPLAY=:0 notify-send -t 2000 --urgency=critical --icon=$Img "Created "$1".tex"

    vim ~/Documents/latex/Misc"$1".tex
fi

