#!/bin/bash

sxhkd &

# No X cursor shape
xsetroot -cursor_name left_ptr

# run hidden gnome-terminal instance to act as server
bspc rule --add Gnome-terminal --one-shot state=floating hidden=on
gnome-terminal &

compton &

xfsettingsd &
xfdesktop --disable-wm-check &
xfce4-notifyd &
polybar top --reload &

dex -a &
thunar --daemon &
CM_SELECTIONS="clipboard" clipmenud &
