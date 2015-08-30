#!/bin/bash

set -e

XUSER=`w -h -s|awk '$3~"^:0"{print $1; exit 0}'`
if [ -z "$XUSER" ]; then
	echo "No one logged in, exiting."
	exit 0;
fi

XHOMEDIR=`getent passwd $XUSER|cut -d: -f6`

export DISPLAY=":0"
export XAUTHORITY="$XHOMEDIR/.Xauthority"

function dock {
	xrandr --output HDMI1 --mode 1920x1080 --pos 0x0 --rotate normal
	xrandr --output VIRTUAL1 --off
	xrandr --output DP1 --off
	xrandr --output eDP1 --off
	xrandr --output VGA1 --mode 1440x900 --pos 1920x90 --rotate normal
}

function undock {
	xrandr --auto
}

if xrandr|grep -q 'HDMI1 connected'; then
	if xrandr|grep -q 'VGA1 connected'; then
		dock
	fi
else
	undock
fi
