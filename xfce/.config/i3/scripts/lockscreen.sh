#/usr/bin/env bash

BACKGROUND="${XDG_CONFIG_HOME:-${HOME}/.config}/i3/lockscreen.png"
i3lock --image="${BACKGROUND}" \
  --color=000000 \
  --ignore-empty-password \
  --show-failed-attempts
