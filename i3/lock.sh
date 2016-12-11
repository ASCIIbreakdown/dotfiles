#!/bin/bash
icon=/home/thom/icon.png
tmpbg=/tmp/screen.png
scrot /tmp/screen.png
convert $tmpbg -blur 0x20 $tmpbg;
convert $tmpbg $icon -gravity center -composite -matte $tmpbg
i3lock -i $tmpbg
