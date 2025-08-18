#!/usr/bin/env bash

if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
  if [ -n "$DBUS_SESSION_BUS_ADDRESS" ]; then
    exec dbus-launch --exit-with-session sway
  else
    echo "Cannot found dbus session: Sway don't work"
  fi
fi
