#!/bin/bash

compton --frame-opacity 0.5 &

xfsettingsd &
xfdesktop --disable-wm-check &
xfce4-panel --disable-wm-check &
xfce4-notifyd &

dex -a &
thunar --daemon &
chromium --no-startup-window &
