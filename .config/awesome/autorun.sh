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
run thunar --daemon
feh --no-fehbg --bg-fill '/home/bali/Pictures/32691151630_9eccc9a49d_o.jpg'
xrandr --output DisplayPort-0 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output DisplayPort-1 --off --output DisplayPort-2 --off --output HDMI-A-0 --mode 1920x1080 --pos 0x0 --rotate normal
