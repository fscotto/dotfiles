function appendpath() {
  case ":$PATH:" in
  *:"$1":*)
  ;;
  *)
  PATH="${PATH:+$PATH:}$1"
  esac
}

if [[ "$HOST" == 'nymph.localhost' ]]; then
  appendpath $GOPATH/bin
  appendpath $HOME/.local/bin
  appendpath $HOME/.pyenv/bin
  appendpath $HOME/.cargo/bin
  appendpath /usr/local/opt/libarchive/bin
  appendpath $HOME/.local/opt/kafka/bin
  appendpath $HOME/.crc/bin
  appendpath $HOME/.crc/bin/oc

  source /usr/local/opt/git-extras/share/git-extras/git-extras-completion.zsh
elif [[ "$HOST" == 'ikaros.fritz.box' ]]; then
  appendpath /opt/homebrew/bin
  appendpath $GOPATH/bin
  appendpath $HOME/.local/bin
fi

unset appendpath

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
