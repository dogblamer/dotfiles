#!/bin/bash

# shows time
date=$(date +'%X')
# shows active window in swaybar, if app_id == null, than the name will be selected.
# https://packages.gentoo.org/packages/app-misc/jq
windowtitle=$(swaymsg -t get_tree 2>/dev/null | jq -r '..|try select(.focused == true).app_id' 2>/dev/null)
windowtitle_name=$(swaymsg -t get_tree 2>/dev/null | jq -r '..|try select(.focused == true).name' 2>/dev/null)
volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '\d+(?=%)' | head -n 1)

# shows ".name"
if [ "$windowtitle" == 'null' ]; then
	echo "$windowtitle_name | $volume % | $date "
# shows ".app.id"
else
	echo "$windowtitle | $volume % | $date "
fi
