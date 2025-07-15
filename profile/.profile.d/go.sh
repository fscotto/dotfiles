#!/usr/bin/env bash

case $(uname -s) in
    "Linux")
        export GOPATH="$HOME/.local/share/Go";;
    "Darwin")
        export GOPATH="$HOME/Library/Go";;
    *)
        echo "Operating System unknown";;
esac

export GOBIN=$GOPATH/bin
