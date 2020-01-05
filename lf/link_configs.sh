#!/bin/bash


mkdir -p $HOME/.config/lf

if [ $(uname) == 'Darwin' ]
then
  ln -sf $HOME/.files/lf/lfrc_macos $HOME/.config/lf/lfrc
  echo "MACOSX"
else
  ln -sf $HOME/.files/lf/lfrc $HOME/.config/lf/lfrc
  echo "Linux"
fi
ln -sf $HOME/.files/lf/draw_img.sh $HOME/.config/lf/draw_img.sh
