#!/usr/bin/env bash

mouse_name="Logitech USB Receiver"
check=$(xinput | grep "$mouse_name")

if [[ -n "$check" ]]; then
  # grab mouse id from xinput
  mouse_id=$(xinput | grep "$mouse_name" | sed 's/^.*id=\([0-9]*\)[ \t].*$/\1/')

  # disable mouse acceleration
  xinput set-prop "$mouse_id" "libinput Accel Profile Enabled" 0, 1
fi
