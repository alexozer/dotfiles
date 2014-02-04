#! /bin/sh
sxhkd &

[ -e "$PANEL_FIFO" ] && rm "$PANEL_FIFO"
mkfifo -m 600 "$PANEL_FIFO"

panel &
trayer --edge top --align right --widthtype pixel --width 60 --heighttype pixel --height 23 --transparent true --alpha 0 --tint 0x232C31 &

bspwm -s "$PANEL_FIFO" -p WM
pkill panel

exit 0
