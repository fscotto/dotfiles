#!/usr/bin/env bash

if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
  if [ -n "$DBUS_SESSION_BUS_ADDRESS" ]; then
    exec sway
  else
    exec dbus-launch --exit-with-session sway
  fi
fi
