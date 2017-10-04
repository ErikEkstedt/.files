#!/bin/bash
# Log folder
cd ~/Documents/latex/Logs/
today=$(date +%Y-%m-%d)

img=/usr/share/icons/gnome/256x256/status/user-available.png 
for f in `ls -r *.pdf *.tex`; 
do 
    if [[ "$f" == *$today* ]]
    then
        #echo "not today!"
        #echo $f
        continue
    else
        # PDF does not exist, make pdf from tex
        # echo "PDF $FILE does not exist. Making pdf of .tex file"
        # echo "$f" 
        F=${f::-4}
        pdf=${f::-4}".pdf"
        # echo $pdf
        if [[ -f $pdf ]]
        then
            DISPLAY=:0 notify-send -t 2000 --urgency=critical --icon=$img "Yesterdays Log entry"
            zathura $pdf 
            break
        else
            latexmk -f -pdf $F
            zathura $pdf
            DISPLAY=:0 notify-send -t 2000 --urgency=critical --icon=$img "Yesterdays Log entry"
            break
        fi
    fi
done

