# Add ~/.local/bin if not exists
case ":$PATH:" in
  *":$HOME/.local/bin:"*) ;;
  *) export PATH="$HOME/.local/bin:$PATH" ;;
esac

if [ -f "/home/linuxbrew/.linuxbrew/bin/brew" ]; then
  # Initialize Homebrew
  export HOMEBREW_NO_ENV_HINTS=1 
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

if command -v starship > /dev/null 2>&1; then
  # Initialize Starship
  eval "$(starship init zsh)"
fi

if [ -e "$HOME/.cargo" ]; then
    source "$HOME/.cargo/env"
fi

export EDITOR="nvim"
export MANPAGER="nvim +Man!"
export DOTFILES="$HOME/.dotfiles"
export GOPATH="$HOME/.local/share/Go"
export GOBIN=$GOPATH/bin
export GRAALVM_HOME="${HOME}/.local/share/mise/installs/java/graalvm-community-23.0.1"
export HELPDIR=/usr/share/zsh/"${ZSH_VERSION}"/help
export JAVA_HOME="${HOME}/.local/share/mise/installs/java/23.0.1"
export VIRTUAL_ENV_DISABLE_PROMPT=1
export JMETER_HOME="$(which jmeter)"
export FZF_HOME=$HOME/.oh-my-zsh/custom/plugins/fzf
export FZF_CTRL_T_COMMAND="fdfind --type f"
export FZF_ALT_C_COMMAND="fdfind --type d"
export FZF_CTRL_R_OPTS="--preview 'echo {}'"
# Export Catppuccin Mocha theme for FZF
export FZF_DEFAULT_OPTS=" \
--height 60% --layout=reverse --border \
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#313244,label:#CDD6F4"

source <(fzf --zsh)
source "$FZF_HOME/shell/key-bindings.zsh"
source "$FZF_HOME/shell/completion.zsh"

# Launch tmux in the default session
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
  tmux attach-session -t default || tmux new-session -s default
fi
