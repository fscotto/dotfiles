#!/usr/bin/env bash

# Times the screen off and puts it to background
swayidle \
  timeout 10 'swaymsg "output * dpms off"' \
  resume 'swaymsg "output * dpms on"' &
# Locks the screen immediately
swaylock -f --font "Noto Sans Regular" --font-size 16
# Kills last background task so idle timer doesn't keep running
kill %%
