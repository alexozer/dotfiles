#!/bin/bash

# run hidden gnome-terminal instance to act as server
bspc rule --add Gnome-terminal --one-shot state=floating hidden=on
gnome-terminal &

compton --backend glx --frame-opacity 0.5 &

xfsettingsd &
xfdesktop --disable-wm-check &
xfce4-notifyd &
polybar top --reload &

dex -a &
thunar --daemon &
chromium --no-startup-window &
