#!/usr/bin/env bash

if [[ "$HOST" == 'nymph.localhost' ]]; then
	export GOPATH=$HOME/Go
elif [[ "$HOST" == 'ikaros.fritz.box' ]]; then
	export GOPATH=$HOME/Library/Go
fi

export GOBIN=$GOPATH/bin
