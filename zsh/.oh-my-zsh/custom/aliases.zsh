is_debian_based() {
    # Checking /etc/os-release
    if [[ -f /etc/os-release ]]; then
        . /etc/os-release
        if [[ "$ID_LIKE" == *"debian"* ]] || [[ "$ID" == "debian" ]]; then
            return 0  # OK: Debian-based
        fi
    fi

    # Alternative check: /etc/debian_version
    if [[ -f /etc/debian_version ]]; then
        return 0  # OK: Debian-based
    fi

    return 1  # NO Debian-based
}

alias ls="eza --color=always --group-directories-first --icons"
alias ll="eza -l --color=always --group-directories-first --icons"
alias la="eza -a --color=always --group-directories-first --icons"
alias lt="eza -aT --color=always --group-directories-first --icons"

# Replace some more things with better alternatives
if is_debian_based; then
  alias bat='batcat'
fi

alias cat='bat --style header --style snip --style changes --style header --pager never'

# Replace df command tool
alias df='duf'

# Replace grep command tool
alias grep='ugrep --color=auto'
alias egrep='ugrep -E --color=auto'
alias fgrep='ugrep -F --color=auto'

# Other aliases
alias paths='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias du='du -h'
alias userlist="cut -d: -f1 /etc/passwd | sort"
alias ip='ip -color'
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
alias stow='stow --dotfiles -d ~/.dotfiles '
alias openport='netstat -nape --inet'
alias kssh='kitty +kitten ssh'
