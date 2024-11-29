#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

shopt -s autocd
shopt -s checkwinsize
shopt -s cdspell
shopt -s cmdhist
shopt -s histappend
shopt -s hostcomplete

# Make colorcoding available for everyone
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

NC="\e[m"               # Color Reset

# new alert text
ALERT=${BWhite}${On_Red} # Bold White on red background

# Creates an archive (*.tar.gz) from given directory.
function maketar() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }

# Create a ZIP archive of a file or folder.
function makezip() { zip -r "${1%%/}.zip" "$1" ; }

function extract {
  if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
  else
    if [ -f $1 ] ; then
      # NAME=${1%.*}
      # mkdir $NAME && cd $NAME
      case $1 in
        *.tar.bz2)   tar xvjf ../$1    ;;
        *.tar.gz)    tar xvzf ../$1    ;;
        *.tar.xz)    tar xvJf ../$1    ;;
        *.lzma)      unlzma ../$1      ;;
        *.bz2)       bunzip2 ../$1     ;;
        *.rar)       unrar x -ad ../$1 ;;
        *.gz)        gunzip ../$1      ;;
        *.tar)       tar xvf ../$1     ;;
        *.tbz2)      tar xvjf ../$1    ;;
        *.tgz)       tar xvzf ../$1    ;;
        *.zip)       unzip ../$1       ;;
        *.Z)         uncompress ../$1  ;;
        *.7z)        7z x ../$1        ;;
        *.xz)        unxz ../$1        ;;
        *.exe)       cabextract ../$1  ;;
        *)           echo "extract: '$1' - unknown archive method" ;;
      esac
    else
    echo "$1 - file does not exist"
    fi
  fi
}
 
# jump directorys upwards until it hits a directory with multiple folders
function up(){
  local d=""
  limit=$1
  for ((i=1 ; i <= limit ; i++))
    do
      d=$d/..
    done
  d=$(echo $d | sed 's/^\///')
  if [ -z "$d" ]; then
    d=..
  fi
  cd $d
}

# create an directory and directly cd into it
function mcd() {
  mkdir -p $1
  cd $1
}

function parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function my_ip() { 
  INTERFACE=`ip addr | awk '/state UP/ {print $2}' | sed 's/.$//'`
  echo `/sbin/ifconfig $INTERFACE | awk "/inet/ {print $2} " | sed -e s/addr://`
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
  fastfetch 2> /dev/null
  echo ""
  echo -ne "Today is "; date
  echo -e ""
  echo -ne "Up time:";uptime | awk /'up/'
  echo -en "Local IP Address : "; my_ip | awk '{print $2}'
  echo "";
}
 
[ -r $HOME/.bashrc.aliases ] && . $HOME/.bashrc.aliases

# export QT_STYLE_OVERRIDE=gtk
# export QT_SELECT=qt5

if [[ $LANG = '' ]]; then
  export LANG=it_IT.UTF-8
fi

if [ -n "$SSH_CLIENT" ]; then
  ssh_placeholder=' {SSH::SESSION}'
fi

if [ -f $HOME/.bash-git-prompt/gitprompt.sh ]; then
  # To only show the git prompt in or under a repository directory
  GIT_PROMPT_ONLY_IN_REPO=0
  # To use upstream's default theme
  GIT_PROMPT_THEME=Custom
  source $HOME/.bash-git-prompt/gitprompt.sh
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

[ -e "/etc/DIR_COLORS" ] && DIR_COLORS="/etc/DIR_COLORS"
[ -e "$HOME/.dircolors" ] && DIR_COLORS="$HOME/.dircolors"
[ -e "$DIR_COLORS" ] || DIR_COLORS=""

# Initialize Homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Initialize Starship
eval "$(starship init bash)"

# Initialize Zoxide
eval "$(zoxide init bash)"

# Activete Mise JDX
eval "$(mise activate bash)"
