#!/bin/bash

# Specifying the icon(s) in the script
# This allows us to change its appearance conditionally
icon=""

player_status=$(playerctl status 2> /dev/null)
if [[ $? -eq 0 ]]; then
    metadata="$(playerctl metadata artist) - $(playerctl metadata title)"
fi

if [[ "$player_status" = "Playing" ]] || [[ "$player_status" = "Paused" ]]; then
    echo "$icon  $metadata"
else
    echo "$icon"
fi
