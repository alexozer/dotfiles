#! /bin/sh

# Not actually used ATM, maybe useful later
# TODO rewrite in Rust or something

wid=$1
class=$2
instance=$3

case "$class" in
    dolphin-emu)
        title=$(xtitle "$wid")

    Zathura|Emacs|Gtkwave)
        echo "state=tiled"
        ;;
    Polybar)
        echo "border=off"
        ;;
    Gpick|Pavucontrol)
        echo "state=floating"
        ;;
    GLava)
        echo "state=floating layer=below sticky=true locked=true border=off rectangle=2560x1600+0+0"
        ;;
    UE4Editor)
        echo "desktop=^2"
        ;;
    discord)
        echo "desktop=^10"
        ;;
    Zenity)
        echo "focus=off"
        ;;
esac
