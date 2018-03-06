#!/bin/bash

function setclip {
  xclip -selection c
}

function getclip {
  xclip -selection clipboard -o
}

file=$(mktemp)
konsole -e "vim "$file" "   # replace with your favorite terminal

cat $file | setclip
rm $file

xdotool key ctrl+v
