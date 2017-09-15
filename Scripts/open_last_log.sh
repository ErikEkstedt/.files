#!/bin/bash
# Log folder
cd ~/Documents/latex/Logs/
today=$(date +%Y-%m-%d)
for f in `ls -r *.pdf *.tex`; 
do 
    if [[ "$f" == *$today* ]]
    then
        #echo "not today!"
        #echo $f
        continue
    else
        # PDF does not exist, make pdf from tex
        echo "PDF $FILE does not exist. Making pdf of .tex file"
        echo "$f" 
        pdf=${f::-4}".pdf"
        echo $pdf
        if [[ -f $pdf ]]
        then
            
            DISPLAY=:0 notify-send -t 2000 --urgency=critical --icon=/usr/share/icons/gnome/256x256/status/user-available.png "Yesterdays Log entry"
            zathura $pdf
            break
        else
            DISPLAY=:0 notify-send -t 2000 --urgency=critical --icon=/usr/share/icons/gnome/256x256/status/user-available.png "Yesterdays Log entry"
            latexmk -f -pdf $f
            break
        fi
    fi
done

