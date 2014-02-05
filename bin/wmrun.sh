#! /bin/sh
sxhkd &

[ -e "$PANEL_FIFO" ] && rm "$PANEL_FIFO"
mkfifo -m 600 "$PANEL_FIFO"

panel &

bspwm -s "$PANEL_FIFO" -p WM
pkill panel

exit 0
