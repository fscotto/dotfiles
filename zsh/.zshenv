[ -f "$HOME/.ghcup/env" ] && . "$HOME/.ghcup/env"

if [ -f "/home/linuxbrew/.linuxbrew/bin/brew" ]; then
  # Initialize Homebrew
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

if command -v oh-my-posh > /dev/null 2>&1; then
  # Initialize Oh My Posh
  eval "$(oh-my-posh init zsh --config "$(brew --prefix oh-my-posh)/themes/peru.omp.json")"
fi

export VIRTUAL_ENV_DISABLE_PROMPT=1
export EDITOR=nvim
export HOMEBREW_NO_ENV_HINTS=1
