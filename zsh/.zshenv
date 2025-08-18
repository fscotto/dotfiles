# XDG Settings Basic
export XDG_CONFIG_HOME=${HOME}/.config
export XDG_DATA_HOME=${HOME}/.local/share
export XDG_CACHE_HOME=${HOME}/.local/cache
export XDG_STATE_HOME=${HOME}/.local/state
export DOTFILES="$HOME/.dotfiles"
export EDITOR=nvim
export HELPDIR=/usr/share/zsh/"${ZSH_VERSION}"/help
export MISE_HOME=$HOME/.local/share/mise/installs

# fzf
export FZF_DEFAULT_COMMAND="fd --hidden --type file --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --hidden --type directory --strip-cwd-prefix --exclude .git"
# Export Catppuccin Mocha theme for FZF
export FZF_DEFAULT_OPTS=" \
--height 60% --layout=reverse --border \
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#313244,label:#CDD6F4"
export FZF_TMUX_OPTS=" -p90%,70%"

case ":$PATH:" in
  *":$HOME/.local/bin:"*) ;;
  *) export PATH="$HOME/.local/bin:$PATH" ;;
esac

# Mise
if command -v mise >/dev/null 2>&1; then
  eval "$(mise activate zsh)"
fi

# Golang
if command -v go >/dev/null 2>&1; then
  export GOPATH="$HOME/.local/share/Go"
  export GOBIN="$GOPATH/bin"
fi

# Load cargo envs
if [ -e "$HOME/.cargo" ]; then
  source "$HOME/.cargo/env"
fi

# Java
if command -v java >/dev/null 2>&1; then
  export JAVA_HOME="$(dirname $(mise bin-paths | grep -i java))"
fi

# Python
export VIRTUAL_ENV_DISABLE_PROMPT=1
