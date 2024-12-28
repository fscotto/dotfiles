#!/usr/bin/env bash

if [ "$(uname -o)"  == "Darwin" ]; then
    export ZSH_HIGHLIGHT_DIR=/opt/homebrew/share/zsh-syntax-highlighting
    export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/opt/homebrew/share/zsh-syntax-highlighting/highlighters
fi
