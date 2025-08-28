#!/usr/bin/env bash

if command -v go > /dev/null 2>&1; then
  export GOPATH="$HOME/.local/share/Go"
  export GOBIN="$GOPATH/bin"
fi
