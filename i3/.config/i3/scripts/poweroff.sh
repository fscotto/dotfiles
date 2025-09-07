#!/bin/bash

chosen=$(echo -e "⏻  Shutdown\n  Restart\n  Logout\n  Suspend\n  Hibernate" | rofi -dmenu -p "Power Menu:" -theme-str 'window {width: 20%;}')

case "$chosen" in
    "⏻  Shutdown") systemctl poweroff ;;
    "  Restart") systemctl reboot ;;
    "  Logout") loginctl terminate-session $XDG_SESSION_ID ;;
    "  Suspend") systemctl suspend ;;
    "  Hibernate") systemctl hibernate ;;
    *) exit 0 ;;
esac
