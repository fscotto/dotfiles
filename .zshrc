# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/plague/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$ZSH/custom

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  archlinux 
  autopep8 
  cabal 
  cargo 
  colored-man-pages 
  colorize 
  command-not-found 
  cp 
  docker 
  docker-compose 
  docker-machine 
  emacs 
  extract 
  git 
  git-auto-fetch 
  git-extras 
  git-flow 
  github 
  gitignore 
  git-prompt 
  git-remote-branch 
  go 
  golang 
  gradle 
  heroku 
  httpie 
  jsontools 
  lein 
  man 
  mix 
  mvn 
  nanoc 
  nmap 
  node 
  npm 
  npx 
  nvm 
  pass 
  perms 
  pip 
  pipenv 
  profiles 
  pylint 
  python 
  rebar 
  redis-cli 
  rust 
  sdk 
  spring 
  stack 
  systemd 
  thefuck 
  themes 
  tmux 
  ufw 
  vscode 
  yarn 
  web-search 
  zsh-completions 
  zsh-navigation-tools 
  zsh_reload
)

source $ZSH/oh-my-zsh.sh

# User configuration

# Powerlevel9k configuration
POWERLEVEL9K_MODE="nerdfont-complete"

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=''
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=''
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{blue}\u256D\u2500%F{white}"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{blue}\u2570\uf460%F{white} "
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon root_indicator context dir dir_writable_joined)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time dir_writable vcs background_jobs_joined ip custom_wifi_signal ram load background_jobs command_execution_time)
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="clear"
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="clear"
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND="yellow"
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND="yellow"
POWERLEVEL9K_DIR_HOME_BACKGROUND="clear"
POWERLEVEL9K_DIR_HOME_FOREGROUND="blue"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="clear"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="blue"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND="clear"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="red"
POWERLEVEL9K_DIR_ETC_BACKGROUND="clear"
POWERLEVEL9K_DIR_ETC_FOREGROUND="white"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="clear"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="white"
POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND="red"
POWERLEVEL9K_ROOT_INDICATOR_FOREGROUND="white"
POWERLEVEL9K_STATUS_OK_BACKGROUND="clear"
POWERLEVEL9K_STATUS_OK_FOREGROUND="green"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="clear"
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="red"
POWERLEVEL9K_TIME_BACKGROUND="clear"
POWERLEVEL9K_TIME_FOREGROUND="cyan"
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='clear'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='magenta'
POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND='clear'
POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND='green'
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='clear'
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='yellow'
POWERLEVEL9K_OS_ICON_BACKGROUND='clear'
POWERLEVEL9K_OS_ICON_FOREGROUND='green'

source "/home/plague/.oh-my-zsh/custom/themes/powerlevel9k/powerlevel9k.zsh-theme"

# Setup emacs keymap
bindkey -e

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
#if [[ -n $SSH_CONNECTION ]]; then
#  export EDITOR='vim'
#else
#  export EDITOR='mvim'
#fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

autoload -U compinit && compinit

function my_ip() { 
  INTERFACE=`ip addr | awk '/state UP/ {print $2}' | sed 's/.$//' | head -n 1`
  echo `ifconfig $INTERFACE | awk "/inet/ {print $2} " | sed -e s/addr://`
}

function welcome() {
  #------------------------------------------
  #------WELCOME MESSAGE---------------------
  # customize this first message with a message of your choice.
  # this will display the username, date, time, a calendar, the amount of users, and the up time.
  clear
  # Gotta love ASCII art with figlet
  #figlet "Welcome, " $USER;
  toilet -f starwars -t "Welcome, " $USER;
  #echo -e ""; cal ;
  # screenfetch 2> /dev/null
  neofetch --color_blocks off 
  echo ""
  echo -ne "Today is "; date
  echo -e ""
  echo -ne "Up time:";uptime | awk /'up/'
  echo -en "Local IP Address : "; my_ip | awk '{print $2}'
  echo "";
}

function appendpath() {
  case ":$PATH:" in
  *:"$1":*)
  ;;
  *)
  PATH="${PATH:+$PATH:}$1"
  esac
}

appendpath $HOME/.local/bin
appendpath $HOME/go/bin
unset appendpath

#[[ -f ~/.profile ]] && . ~/.profile

# added by travis gem
[ -f /home/plague/.travis/travis.sh ] && source /home/plague/.travis/travis.sh

# Set up Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  					# This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

welcome
eval $(thefuck --alias)

# opam configuration
test -r /home/plague/.opam/opam-init/init.zsh && . /home/plague/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# opam configuration
test -r /home/plague/.opam/opam-init/init.zsh && . /home/plague/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/plague/.sdkman"
[[ -s "/home/plague/.sdkman/bin/sdkman-init.sh" ]] && source "/home/plague/.sdkman/bin/sdkman-init.sh"

