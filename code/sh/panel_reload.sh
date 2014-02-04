#!/bin/sh

# Kill all processes using the fifo except the wm
kill $(fuser $PANEL_FIFO | cut -d\  -f5-)
panel &
exit
