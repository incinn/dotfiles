#!/bin/bash

selected=$(echo "Ultrawide
PBP Fullscreen
PBP Split
Reset" | rofi -dmenu -i -p "Select display mode:")
[[ -z $selected ]] && exit

case $selected in
"Ultrawide")
	exec $HOME/.config/i3/monitors.sh -w
	;;
"PBP Fullscreen")
	exec $HOME/.config/i3/monitors.sh -b
	;;
"PBP Split")
	exec $HOME/.config/i3/monitors.sh -a
	;;
"Reset")
	exec $HOME/.config/i3/monitors.sh -r
	;;
*)
	exit 1
	;;
esac
