#!/bin/bash
tmpbg=/tmp/screen.png
scrot /tmp/screen.png
convert $tmpbg -blur 0x20 $tmpbg;
i3lock -i $tmpbg
