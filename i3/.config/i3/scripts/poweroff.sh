#!/bin/bash

# Menu di power con rofi
chosen=$(echo -e "⏻  Spegni\n  Riavvia\n  Logout\n  Sospendi\n  Iberna" | rofi -dmenu -p "Power Menu:" -theme-str 'window {width: 20%;}')

case "$chosen" in
    "⏻  Spegni") systemctl poweroff ;;
    "  Riavvia") systemctl reboot ;;
    "  Logout") loginctl terminate-session $XDG_SESSION_ID ;;
    "  Sospendi") systemctl suspend ;;
    "  Iberna") systemctl hibernate ;;
    *) exit 0 ;;
esac
