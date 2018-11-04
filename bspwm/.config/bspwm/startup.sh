#!/bin/bash

sxhkd &

# No X cursor shape
xsetroot -cursor_name left_ptr

# run hidden gnome-terminal instance to act as server
bspc rule --add Gnome-terminal --one-shot state=floating hidden=on desktop=^10
gnome-terminal &

xfsettingsd &
xfce4-notifyd &
polybar top --reload &
xfdesktop --disable-wm-check &

thunar --daemon &
CM_SELECTIONS="clipboard" clipmenud &

dex -a
