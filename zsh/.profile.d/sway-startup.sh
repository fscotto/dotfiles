#!/usr/bin/env bash

if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
	if [ -n "$DBUS_SESSION_BUS_ADDRESS" ]; then

		# XDG Settings Basic
		export XDG_CONFIG_HOME=${HOME}/.config
		export XDG_DATA_HOME=${HOME}/.local/share
		export XDG_CACHE_HOME=${HOME}/.local/cache
		export XDG_STATE_HOME=${HOME}/.local/state

		# XDG_CONFIG_HOME
		export GTK2_RC_FILES=${XDG_CONFIG_HOME}/gtk-2.0/gtkrc-2.0

		# Reduces crashs for some gdk apps, like evolution
		# ! Do not set as global variable. Electron Apps will not start !
		# export GDK_BACKEND=wayland

		# Required for tray icons on waybar
		export XDG_CURRENT_DESKTOP=sway

		# Enable QT apps to have gtk theme
		export QT_QPA_PLATFORMTHEME=qt5ct

		# Force wayland on qt apps
		export QT_QPA_PLATFORM=wayland

		export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
		# Explicitly set to '96' instead of 'physical' because some apps have problems
		# Looking at you nextcloud client!
		# https://github.com/nextcloud/desktop/issues/1079
		# https://github.com/swaywm/sway/issues/2424
		export QT_WAYLAND_FORCE_DPI=96

		# Make Qt apps honour DPI settings.
		export QT_AUTO_SCREEN_SCALE_FACTOR=1

		# Mozilla Wayland support + hardware video decoding
		export MOZ_ENABLE_WAYLAND=1
		export MOZ_WAYLAND_USE_VAAPI=1

		# SDL
		export SDL_VIDEODRIVER=wayland

		# Java under Xwayland
		export _JAVA_AWT_WM_NONREPARENTING=1

		# Session Type for later screensharing
		export XDG_SESSION_TYPE=wayland

		exec dbus-launch --exit-with-session sway
	else
		echo "Cannot found dbus session: Sway don't work"
	fi
fi
