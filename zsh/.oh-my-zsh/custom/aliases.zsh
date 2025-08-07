alias ls="eza --color=always --group-directories-first --icons=always"

alias fd='fdfind'

alias cat='batcat --style header --style snip --style changes --style header --pager never'

# Replace df command tool
alias df='duf'

# Replace Vim implementation
alias vi='nvim'
alias vim='nvim'

# Replace grep command tool
alias grep='ugrep --color=auto'
alias egrep='ugrep -E --color=auto'
alias fgrep='ugrep -F --color=auto'

# Other aliases
alias paths='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias userlist="cut -d: -f1 /etc/passwd | sort"
alias ip='ip -color'
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
alias stow='stow -d $DOTFILES '
alias ssh-add='ssh-add.exe'
alias ssh='ssh-add.exe -l > /dev/null || ssh-add.exe && echo -e "\e[92mssh-key(s) are now available in your ssh-agent until you lock your windows machine! \n \e[0m" && ssh.exe'
