[ -f "$HOME/.ghcup/env" ] && . "$HOME/.ghcup/env"

if [ -f "/home/linuxbrew/.linuxbrew/bin/brew" ]; then
  # Initialize Homebrew
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

if command -v starship > /dev/null 2>&1; then
  # Initialize Starship
  eval "$(starship init zsh)"
fi

# Aggiungi ~/.local/bin a PATH se non c'è già
case ":$PATH:" in
  *":$HOME/.local/bin:"*) ;;
  *) export PATH="$HOME/.local/bin:$PATH" ;;
esac

