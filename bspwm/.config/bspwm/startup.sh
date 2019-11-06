#!/bin/bash

sxhkd &

# No X cursor shape
xsetroot -cursor_name left_ptr

# run hidden gnome-terminal instance to act as server
bspc rule --add Gnome-terminal --one-shot state=floating hidden=on desktop=^10
gnome-terminal &

xfsettingsd &
xfce4-notifyd &
xfdesktop --disable-wm-check &

thunar --daemon &
CM_SELECTIONS="clipboard" clipmenud &

steam -silent &
discord &
timetrack &
# redshift-gtk &
dropbox &

# Try to start new sessions; if they already exist, oh well
tmux new-session -d -s weechat weechat &
tmux new-session -d -s backup backup &

dex -a &

udiskie --no-notify --tray &

sleep 1 && polybar top --reload &
