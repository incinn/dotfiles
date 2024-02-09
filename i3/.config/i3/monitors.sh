#!/bin/bash

reset_monitor() {
	activeMonitors=$(xrandr --listactivemonitors)

	xrandr -s 5120x1440
	xrandr --fb 5120x1440

	[[ "$activeMonitors" == *"VIRTUAL-CENTER"* ]] && xrandr --delmonitor VIRTUAL-CENTER
	[[ "$activeMonitors" == *"VIRTUAL-LEFT"* ]] && xrandr --delmonitor VIRTUAL-LEFT
	[[ "$activeMonitors" == *"VIRTUAL-RIGHT"* ]] && xrandr --delmonitor VIRTUAL-RIGHT
	[[ "$activeMonitors" == *"VIRTUAL-PBP-LEFT"* ]] && xrandr --delmonitor VIRTUAL-PBP-LEFT
	[[ "$activeMonitors" == *"VIRTUAL-PBP-RIGHT"* ]] && xrandr --delmonitor VIRTUAL-PBP-RIGHT
	[[ "$activeMonitors" == *"VIRTUAL-PBP"* ]] && xrandr --delmonitor VIRTUAL-PBP
}

while getopts "abwr" option; do
	case $option in
	a)
		echo "picture by picture split mode..."
		reset_monitor

		xrandr -s 2560x1440
		xrandr --fb 2560x1440

		xrandr --setmonitor VIRTUAL-PBP-LEFT 1280/298x1440/340+0+0 DP-0
		xrandr --setmonitor VIRTUAL-PBP-RIGHT 1280/298x1440/340+1280+0 none

		i3-msg restart
		exit 0
		;;
	b)
		echo "picture by picture full mode..."
		reset_monitor

		xrandr -s 2560x1440
		xrandr --fb 2560x1440

		xrandr --setmonitor VIRTUAL-PBP 2560/596x1440/340+0+0 DP-0

		i3-msg restart
		exit 0
		;;
	w)
		echo "ultrawide split mode..."
		reset_monitor

		xrandr --setmonitor VIRTUAL-CENTER 2560/596x1440/340+1280+0 DP-0
		xrandr --setmonitor VIRTUAL-LEFT 1280/297x1440/340+0+0 none
		xrandr --setmonitor VIRTUAL-RIGHT 1280/297x1440/340+3840+0 none

		i3-msg restart
		exit 0
		;;
	r)
		echo "resetting monitor..."
		reset_monitor
		i3-msg restart
		exit 0
		;;
	*)
		echo "Usage:"
		echo "[-a] picture-by-picture split"
		echo "[-b] picture-by-picture full"
		echo "[-w] ultrawide split"
		echo "[-r] reset"
		exit 1
		;;
	esac
done
