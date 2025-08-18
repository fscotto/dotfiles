# load modules
zmodload zsh/complist
autoload -U compinit && compinit
autoload -U colors && colors
# autoload -U tetris # main attraction of zsh, obviously

# cmp opts
zstyle ':completion:*' menu select # tab opens cmp menu
zstyle ':completion:*' special-dirs true # force . and .. to show in cmp menu
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} ma=0\;33 # colorize cmp menu
# zstyle ':completion:*' file-list true # more detailed list
zstyle ':completion:*' squeeze-slashes false # explicit disable to allow /*/ expansion

# main opts
setopt append_history inc_append_history share_history # better history
# on exit, history appends rather than overwrites; history is appended as soon as cmds executed; history shared across sessions
setopt auto_menu menu_complete # autocmp first menu match
setopt autocd # type a dir to cd
setopt auto_param_slash # when a dir is completed, add a / instead of a trailing space
setopt no_case_glob no_case_match # make cmp case insensitive
setopt globdots # include dotfiles
setopt extended_glob # match ~ # ^
setopt interactive_comments # allow comments in shell
unsetopt prompt_sp # don't autoclean blanklines
stty stop undef # disable accidental ctrl s

# history opts
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE="$XDG_CACHE_HOME/zsh_history" # move histfile to cache
HISTCONTROL=ignoreboth # consecutive duplicates & commands starting with space are not saved

fpath=(~/.zsh $fpath)

autoload run-help

# fzf setup
source <(fzf --zsh) # allow for fzf history widget

# binds
bindkey -e

# set up prompt
NEWLINE=$'\n'
PROMPT='%F{blue}%B%~%b%f %F{green}❯%f '

# load plugins
ZSH_PLUGINS_DIR="$ZSH_HOME/plugins"
[ -e "$ZSH_PLUGINS_DIR/colored-man-pages.plugin.zsh" ] && source "$ZSH_PLUGINS_DIR/colored-man-pages.plugin.zsh"
[ -e "$ZSH_PLUGINS_DIR/command-not-found-plugin.zsh" ] && source "$ZSH_PLUGINS_DIR/command-not-found-plugin.zsh"
[ -e "$ZSH_PLUGINS_DIR/zoxide.plugin.zsh" ] && source "$ZSH_PLUGINS_DIR/zoxide.plugin.zsh"
[ -e "$ZSH_PLUGINS_DIR/fzf-git.sh" ] && source "$ZSH_PLUGINS_DIR/fzf-git.sh"
[ -e "$ZSH_PLUGINS_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && source "$ZSH_PLUGINS_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
[ -e "$ZSH_PLUGINS_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh" ] && source "$ZSH_PLUGINS_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh"

# define user aliases
pbcopy() {
  if [ -f "$1" ]; then
    mime_type=$(file --mime-type -b "$1")
    wl-copy --type "$mime_type" < "$1"
  else 
    printf "%s" "$*" | wl-copy
  fi
}

alias pbpaste='wl-paste --no-newline'
alias ls='ls --color=auto --group-directories-first'

# Replace Vim implementation
alias vi='nvim'
alias vim='nvim'

# Replace grep command tool
alias grep='grep --color=auto'
alias egrep='grep -E'
alias fgrep='grep -F'

# Other aliases
alias paths='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias userlist="cut -d: -f1 /etc/passwd | sort"
alias ip='ip -color'
alias stow='stow -d $DOTFILES '

if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
  tmux attach-session -t default || tmux new-session -s default
fi
