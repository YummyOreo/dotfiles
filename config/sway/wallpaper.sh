#!/bin/bash

WAYLAND_DISPLAY=wayland-0
WP_PATH=~/Pictures/wallpapers/
SWAYSOCK=$(find /run/user/1000/sway*sock)

LIST=(`ls -1 $WP_PATH`)
WP_COUNT=`ls -1 $WP_PATH | wc -l`

CURRENT_WP=$RANDOM
let "CURRENT_WP %= $WP_COUNT"

/usr/bin/swaymsg -s $SWAYSOCK output "*" bg $WP_PATH/${LIST[CURRENT_WP]} fill
exit 0
