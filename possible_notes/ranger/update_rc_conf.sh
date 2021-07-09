#!/bin/bash

conf_dir=~/.config/ranger
case `uname` in
  Darwin)
    echo "Use Macos conf (macrc.conf)"
    cat rc_super.conf rc_mac.conf > $conf_dir/rc.conf
    ;;
  Linux)
    echo "-> rc.conf" 
    cat rc_super.conf rc_linux.conf > $conf_dir/rc.conf
    ;;
esac
