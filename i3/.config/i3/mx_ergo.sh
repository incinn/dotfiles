#!/usr/bin/env bash

mouse_name="Logitech MX Ergo"
check=$(xinput | grep "$mouse_name")

if [[ -n "$check" ]]; then
  # grab mouse id from xinput
  # MX Ergo has a virtual keyboard of the same name
  # so only grab the first id as mice are listed first
  mouse_id=$(xinput | grep "$mouse_name" | sed 's/^.*id=\([0-9]*\)[ \t].*$/\1/' | head -n 1)

  # disable mouse acceleration
  xinput set-prop "$mouse_id" "libinput Accel Profile Enabled" 0, 1
fi
