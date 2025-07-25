#!/usr/bin/env bash

is_debian_based() {
	# Checking /etc/os-release
	if [[ -f /etc/os-release ]]; then
		. /etc/os-release
		if [[ "$ID_LIKE" == *"debian"* ]] || [[ "$ID" == "debian" ]]; then
			return 0 # OK: Debian-based
		fi
	fi

	# Alternative check: /etc/debian_version
	if [[ -f /etc/debian_version ]]; then
		return 0 # OK: Debian-based
	fi

	return 1 # NO Debian-based
}

# Add fzf keybindings and enhancements
if is_debian_based; then
	export FZF_CTRL_T_COMMAND="fdfind --type f"
	export FZF_ALT_C_COMMAND="fdfind --type d"
else
	export FZF_CTRL_T_COMMAND="fd --type f"
	export FZF_ALT_C_COMMAND="fd --type d"
fi

export FZF_CTRL_R_OPTS="--preview 'echo {}'"

# Export Catppuccin Mocha theme for FZF
export FZF_DEFAULT_OPTS=" \
--height 60% --layout=reverse --border \
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#313244,label:#CDD6F4"
