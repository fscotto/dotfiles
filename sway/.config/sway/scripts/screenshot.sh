#!/usr/bin/env bash

file="$HOME/Pictures/Screenshots/$(date +%Y-%m-%dT%H:%M:%S).png"
thumb="/tmp/screenshot-thumb.png"
grim "$file" \
  && wl-copy < "$file" \
  && magick "$file" -resize 640x480 "$thumb" \
  && fyi -i "$thumb" "📸 Catch screenshot"
