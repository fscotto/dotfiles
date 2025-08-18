# XDG Settings Basic
export XDG_CONFIG_HOME=${HOME}/.config
export XDG_DATA_HOME=${HOME}/.local/share
export XDG_CACHE_HOME=${HOME}/.local/cache
export XDG_STATE_HOME=${HOME}/.local/state
export DOTFILES="$HOME/.dotfiles"
export EDITOR=nvim
export HELPDIR=/usr/share/zsh/"${ZSH_VERSION}"/help
export MISE_HOME=$HOME/.local/share/mise/installs
export MANPAGER="less -R --use-color -Dd+r -Du+b" # colored man pages

# colored less + termcap vars
export LESS="R --use-color -Dd+r -Du+b"
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"

# fzf
export FZF_DEFAULT_COMMAND="fdfind --hidden --type file --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fdfind --hidden --type directory --strip-cwd-prefix --exclude .git"
# Export Catppuccin Mocha theme for FZF
export FZF_DEFAULT_OPTS=" \
--height 60% --layout=reverse --border \
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#313244,label:#CDD6F4"
export FZF_TMUX_OPTS=" -p90%,70%"

# Golang
if command -v go >/dev/null 2>&1; then
  export GOPATH="$HOME/.local/share/Go"
  export GOBIN="$GOPATH/bin"
fi

# Java
if command -v java >/dev/null 2>&1; then
  export JAVA_HOME="$(dirname $(mise bin-paths | grep -i java))"
fi

# Python
export VIRTUAL_ENV_DISABLE_PROMPT=1

