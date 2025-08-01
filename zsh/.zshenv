export DOTFILES="$HOME/.dotfiles"
export EDITOR=nvim
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
export FZF_CTRL_T_OPTS="--preview 'bat --color=always -n --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --treee --color=always {} | head -200'"
export GOPATH="$HOME/.local/share/Go"
export GOBIN=$GOPATH/bin
export GRAALVM_HOME="${HOME}/.local/share/mise/installs/java/graalvm-community-23.0.1"
export JAVA_HOME="${HOME}/.local/share/mise/installs/java/23.0.1"
export HELPDIR=/usr/share/zsh/"${ZSH_VERSION}"/help
export JMETER_HOME="$(which jmeter)"
export VIRTUAL_ENV_DISABLE_PROMPT=1

