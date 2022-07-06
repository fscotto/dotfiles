#!/usr/bin/env bash

if [[ "$HOST" == 'nymph.localhost' ]]; then
	export ZSH_HIGHLIGHT_DIR=/usr/local/share/zsh-syntax-highlighting
	export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters
elif [[ "$HOST" == 'ikaros.fritz.box' ]]; then
	export ZSH_HIGHLIGHT_DIR=/opt/homebrew/share/zsh-syntax-highlighting
	export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/opt/homebrew/share/zsh-syntax-highlighting/highlighters
fi