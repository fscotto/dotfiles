function appendpath() {
  case ":$PATH:" in
  *:"$1":*)
  ;;
  *)
  PATH="${PATH:+$PATH:}$1"
  esac
}

<<<<<<< Updated upstream:.zshenv-linux
appendpath $GOBIN
appendpath $HOME/.local/bin
=======
appendpath "$GOPATH/bin"
appendpath "$HOME/.local/bin"
appendpath "$HOME/Library/Application\ Support/JetBrains/Toolbox/scripts"
>>>>>>> Stashed changes:.zshenv

unset appendpath

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
# 