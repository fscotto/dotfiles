pbcopy() {
  if [ -f "$1" ]; then
    mime_type=$(file --mime-type -b "$1")
    wl-copy --type "$mime_type" < "$1"
  else 
    printf "%s" "$*" | wl-copy
  fi
}

alias pbpaste='wl-paste --no-newline'
alias ls="eza --color=always --group-directories-first --icons=always"
alias cat='bat --style header --style snip --style changes --pager never'

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
alias stow='stow -d $DOTFILES '
