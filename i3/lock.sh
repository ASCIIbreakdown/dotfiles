#!/bin/bash
tmpbg=/tmp/screen.png
icon=~/.config/i3/lock.png
scrot $tmpbg
notify-send -i ~/.config/i3/lock.png -t 1000 "Locking..." "Locking your computer"
convert $tmpbg -blur 0x20 $tmpbg;
convert $tmpbg $icon -gravity center -composite -matte $tmpbg
i3lock -i $tmpbg
