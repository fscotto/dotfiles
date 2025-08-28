#!/usr/bin/env bash

if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
  if [ -n "$DBUS_SESSION_BUS_ADDRESS" ]; then
    # XDG Wayland support
    export XDG_CURRENT_DESKTOP=sway # Required for tray icons on waybar
    export XDG_SESSION_TYPE=wayland # Session Type for later screensharing

    # Force wayland on qt apps
    export QT_QPA_PLATFORM=wayland
    export QT_WAYLAND_DISABLE_WINDOWDECORATION=1

    # Explicitly set to '96' instead of 'physical' because some apps have problems
    # Looking at you nextcloud client!
    # https://github.com/nextcloud/desktop/issues/1079
    # https://github.com/swaywm/sway/issues/2424
    export QT_WAYLAND_FORCE_DPI=96

    # Mozilla Wayland support + hardware video decoding
    export MOZ_ENABLE_WAYLAND=1
    export MOZ_WAYLAND_USE_VAAPI=1

    # Reduces crashs for some gdk apps, like evolution
    # ! Do not set as global variable. Electron Apps will not start !
    # export GDK_BACKEND=wayland

    # SDL
    export SDL_VIDEODRIVER=wayland

    # Java under Xwayland
    export _JAVA_AWT_WM_NONREPARENTING=1

    # Launch Sway through dbus
    exec dbus-run-session sway
  else
    echo "Cannot found DBus session, Wayland startup failed"
  fi
fi
