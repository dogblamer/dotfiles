#!/bin/bash

# shows time
date=$(date +'%X')

# shows active window in swaybar, if app_id == null, than the name will be selected.
# https://packages.gentoo.org/packages/app-misc/jq
windowtitle=$(swaymsg -t get_tree 2>/dev/null | jq -r '..|try select(.focused == true).app_id' 2>/dev/null)
windowtitle_name=$(swaymsg -t get_tree 2>/dev/null | jq -r '..|try select(.focused == true).name' 2>/dev/null)
windowtitle_ws=$(swaymsg -t get_tree 2>/dev/null | jq -r '..|try select(.focused == true).name' 2>/dev/null)
NUM=$"5"
NUMF=$=[$NUM+0]

# shows ".name"
# checks if windowtitle is a workspace number
for NUM in {1..10}; do
	if [ "$windowtitle_ws" == NUM ] ; then
		echo "| $date "
	# shows ".name"
	elif [ "$windowtitle" == 'null' ]; then
		echo "$windowtitle_name | $date "
	# shows ".app.id"
	else
		echo "$windowtitle | $date "
	fi
done
