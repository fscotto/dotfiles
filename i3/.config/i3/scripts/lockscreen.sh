#/usr/bin/env bash

BACKGROUND="${XDG_CONFIG_HOME:-${HOME}/.config}/i3/lockscreen.jpg"
i3lock --image="${BACKGROUND}" \
  --color=000000 \
  --max \
  --ignore-empty-password \
  --show-failed-attempts \
  --clock
