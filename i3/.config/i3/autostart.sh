#!/usr/bin/env bash

# Compositor
picom --config ~/.config/picom/picom.conf &

# Polybar
~/.config/polybar/launch.sh

# Notifications
dunst &

# Wallpaper
feh --bg-scale ~/.config/i3/wallpaper.jpg &

# Audio
pipewire &
# pipewire-pulse &

# Clipboard manager
# xfce4-clipman &

# Screenshot tool
flameshot &

# GTK settings
xsettingsd &

# Lock screen auto
xautolock -time 5 -locker "i3lock-color -c 000000" -detectsleep &

# Network manager applet
nm-applet &

# Autotiling
i3-auto-layout --limit 2 &
