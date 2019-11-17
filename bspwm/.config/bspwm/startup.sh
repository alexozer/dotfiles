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
steam -silent &
discord &
timetrack &
dropbox &
tmux new-session -d -s weechat weechat &
dex -a &
udiskie --no-notify --tray &
# redshift-gtk &
# CM_SELECTIONS="clipboard" clipmenud &

sleep 1 && polybar top --reload &
