#!/usr/bin/env bash

# ______________   _________  ________________
# | back       |   |       |  | right click  |
# --------------   |       |  ----------------
# ______________   |       |  ________________
# | left click |   |       |  | middle click |
# --------------   ---------  ----------------

mouse_name="Kensington Expert Mouse"
check=$(xinput | grep "$mouse_name")

if [[ -n "$check" ]]; then
  # grab mouse id from xinput
  mouse_id=$(xinput | grep "$mouse_name" | sed 's/^.*id=\([0-9]*\)[ \t].*$/\1/')

  # remap buttons
  xinput set-button-map "$mouse_id" 1 8 2 4 5 6 7 3 9

  # disable mouse acceleration
  xinput set-prop "$mouse_id" "libinput Accel Profile Enabled" 0, 1

  # disable natural scrolling
  xinput set-prop "$mouse_id" "libinput Natural Scrolling Enabled" 0

  # set scroll method
  xinput set-prop "$mouse_id" "libinput Scroll Method Enabled" 0, 0, 1

  # set middle mouse as scrolling button
  # xinput set-prop "$mouse_id" "libinput Button Scrolling Button" 3
fi
