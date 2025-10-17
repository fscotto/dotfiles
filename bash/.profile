function appendpath() {
  local location="${1}"
  case ":$PATH:" in
    *":$location:"*) ;;
    *) export PATH="$PATH:$location" ;;
  esac
}

appendpath "$HOME/.local/bin"
appendpath "$HOME/.cargo/bin"
appendpath "/home/linuxbrew/.linuxbrew/bin"
unset appendpath

# XDG variables
export XDG_CONFIG_HOME=${HOME}/.config
export XDG_DATA_HOME=${HOME}/.local/share
export XDG_CACHE_HOME=${HOME}/.local/cache
export XDG_STATE_HOME=${HOME}/.local/state

# Enable GTK themes
export GTK2_RC_FILES=${XDG_CONFIG_HOME}/gtk-2.0/gtkrc-2.0

# Enable QT apps to have gtk theme
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_STYLE_OVERRIDE=kvantum

# Make Qt apps honour DPI settings.
export QT_AUTO_SCREEN_SCALE_FACTOR=1

export ZSH_HOME="$HOME/.zsh"
export DOTFILES="$HOME/.dotfiles"
export EDITOR=nvim
export HELPDIR=/usr/share/zsh/"${ZSH_VERSION}"/help

# SSH socket
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/gcr/ssh"

# export FZF_DEFAULT_COMMAND="fdfind --hidden --type file --strip-cwd-prefix --exclude .git"
# export FZF_CTRL_T_COMMAND="fdfind --hidden --type file --strip-cwd-prefix --exclude .git"
# export FZF_ALT_C_COMMAND="fdfind --hidden --type directory --strip-cwd-prefix --exclude .git"
# # Export Catppuccin Mocha theme for FZF
# export FZF_DEFAULT_OPTS=" \
# --height 60% --layout=reverse --border \
# --color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
# --color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
# --color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
# --color=selected-bg:#45475A \
# --color=border:#313244,label:#CDD6F4"
# export FZF_TMUX_OPTS=" -p90%,70%"
export VIRTUAL_ENV_DISABLE_PROMPT=1

source "$HOME/.profile.d/homebrew.sh"
source "$HOME/.profile.d/mise.sh"
source "$HOME/.profile.d/golang.sh"
source "$HOME/.profile.d/java.sh"

