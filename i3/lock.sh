#!/bin/bash
tmpbg=/tmp/screen.png
icon=~/.config/i3/lock.png
scrot /tmp/screen.png
notify-send Locking...
convert $tmpbg -blur 0x20 $tmpbg;
convert $tmpbg $icon -gravity center -composite -matte $tmpbg
i3lock -i $tmpbg
