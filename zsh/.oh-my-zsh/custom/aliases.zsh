# Alias del comando ls
alias ls="eza --color=always --group-directories-first --icons"
alias ll="eza -l --color=always --group-directories-first --icons"
alias la="eza -a --color=always --group-directories-first --icons"
alias lt="eza -aT --color=always --group-directories-first --icons"

# Replace some more things with better alternatives
alias cat='bat --style header --style snip --style changes --style header --pager never'

# Replace df command tool
alias df='duf'

# Replace grep command tool
alias grep='ugrep --color=auto'
alias egrep='ugrep -E --color=auto'
alias fgrep='ugrep -F --color=auto'

# Alias vari
alias paths='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias mkdir="mkdir -pv"
alias journalctl='sudo journalctl'
alias failed='sudo systemctl --failed'
alias se='ls /usr/bin | grep'
alias du='du -h'
alias please='sudo $(fc -ln -1)'
alias userlist="cut -d: -f1 /etc/passwd | sort"
alias fhere="find . -name "
alias free="free -mth"
alias ps="ps auxf"
alias ip='ip -color'
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias wget="wget -c"
alias histg="history | grep"
alias myip="curl http://ipecho.net/plain; echo"
alias logs="find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f"
alias folders='find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'
alias vpn-add='nmcli connection import type openvpn file'
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
alias stow='stow --dotfiles -d ~/.dotfiles '
alias openport='netstat -nape --inet'
alias kssh='kitty +kitten ssh'
alias lzg=lazygit
alias lzd=lazydocker
