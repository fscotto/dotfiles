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
appendpath $HOME/.pyenv/bin
appendpath $HOME/.minishift/cache/oc/v3.11.0/darwin
appendpath /usr/local/opt/libarchive/bin
appendpath /Library/Java/JavaVirtualMachines/graalvm-ce-java11-21.1.0/Contents/Home/bin
unset appendpath

source /usr/local/opt/git-extras/share/git-extras/git-extras-completion.zsh

# Adding PROLOG programming language
export LDFLAGS="-L/usr/local/opt/libarchive/lib"
export CPPFLAGS="-I/usr/local/opt/libarchive/include"
export PKG_CONFIG_PATH="/usr/local/opt/libarchive/lib/pkgconfig"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/plague/.sdkman"
[[ -s "/Users/plague/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/plague/.sdkman/bin/sdkman-init.sh"
