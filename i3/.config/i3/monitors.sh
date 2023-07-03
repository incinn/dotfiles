#!/bin/bash

if [ -z "$(xrandr --listactivemonitors | grep 'VIRTUAL-CENTER')"]; then
  xrandr --setmonitor VIRTUAL-CENTER 2560/596x1440/340+1280+0 DP-0
  xrandr --setmonitor VIRTUAL-LEFT 1280/297x1440/340+0+0 none
  xrandr --setmonitor VIRTUAL-RIGHT 1280/297x1440/340+3840+0 none
  xrandr --fb 5120x1440
else
  xrandr --delmonitor VIRTUAL-CENTER
  xrandr --delmonitor VIRTUAL-LEFT
  xrandr --delmonitor VIRTUAL-RIGHT
  xrandr --fb 5120x1440
fi
