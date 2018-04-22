#!/bin/bash

sxhkd &

# run hidden gnome-terminal instance to act as server
bspc rule --add Gnome-terminal --one-shot state=floating hidden=on
gnome-terminal &

compton &

xfsettingsd &
xfdesktop --disable-wm-check &
xfce4-notifyd &
polybar top --reload &
xfce4-panel --disable-wm-check &

dex -a &
thunar --daemon &
chromium --no-startup-window &
CM_SELECTIONS="clipboard" clipmenud &
