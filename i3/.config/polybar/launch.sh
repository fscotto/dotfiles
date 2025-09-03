#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch barxs
echo "---" | tee -a /tmp/polybar-mybar.log
polybar mainbar 2>&1 | tee -a /tmp/polybar-mybar.log & disown

echo "Bars launched..."
