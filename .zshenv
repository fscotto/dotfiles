function appendpath() {
  case ":$PATH:" in
  *:"$1":*)
  ;;
  *)
  PATH="${PATH:+$PATH:}$1"
  esac
}

appendpath $GOPATH/bin
appendpath $HOME/.local/bin
appendpath $HOME/.cargo/bin
appendpath $HOME/.pyenv/bin
unset appendpath

source /usr/local/opt/git-extras/share/git-extras/git-extras-completion.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/plague/.sdkman"
[[ -s "/Users/plague/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/plague/.sdkman/bin/sdkman-init.sh"
