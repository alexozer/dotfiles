xrdb ~/.Xresources
xset +fp /usr/share/fonts/local 
xset +fp /usr/share/fonts/TTF
xset +fp /home/alex/.fonts
xset +fp /usr/share/fonts/artwiz-fonts
xset +fp /usr/share/fonts/misc 
xset fp rehash 

~/.screenlayout/dualmon.sh &
xsetroot -cursor_name left_ptr &
xset m 1 2 &
syndaemon -i 0.4 -k -t -R -d &

xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape' &
#unclutter -grab -noevents -root &
urxvtd &
feh --bg-fill /home/alex/pic/walls/qnbL9I.jpg &
nm-applet &
#compton -cCb &
#redshift -l geoclue &
asus-kbd-backlight off

# Start a D-Bus session
#source /etc/X11/xinit/xinitrc.d/30-dbus
# Start GNOME Keyring
#eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
# You probably need to do this too:
#export GNOME_KEYRING_CONTROL GNOME_KEYRING_PID GPG_AGENT_INFO SSH_AUTH_SOCK

thunar --daemon &

exec wmrun.sh
