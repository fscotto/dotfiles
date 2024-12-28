#!/usr/bin/env bash

case $(uname -s) in
    "Darwin")
        export ZSH_HIGHLIGHT_DIR=/opt/homebrew/share/zsh-syntax-highlighting
        export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/opt/homebrew/share/zsh-syntax-highlighting/highlighters
        ;;
    "Linux")
        export ZSH_HIGHLIGHT_DIR=/usr/share/zsh-syntax-highlighting
        export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/share/zsh-syntax-highlighting/highlighters
        export ZSH_AUTOSUGGESTIONS_DIR=/usr/share/zsh-autosuggestions
        ;;
esac