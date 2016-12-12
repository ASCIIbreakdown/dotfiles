#!/bin/bash
tmpbg=/tmp/screen.png
scrot /tmp/screen.png
notify-send Locking...
convert $tmpbg -blur 0x20 $tmpbg;
i3lock -i $tmpbg
