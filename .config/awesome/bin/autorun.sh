#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

#run gnome-keyring-daemon -d
setxkbmap es -option 'ctrl:nocaps','shift:both_capslock'
run nm-applet
run picom
run ~/.config/awesome/bin/mylayout.sh
run ~/.config/awesome/bin/mybg.sh
