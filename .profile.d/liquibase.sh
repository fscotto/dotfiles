#!/usr/bin/env bash

if [[ "$HOST" == 'nymph.localhost' ]]; then
	export LIQUIBASE_HOME="/usr/local/opt/liquibase/libexec"
elif [[ "$HOST" == 'ikaros.fritz.box' ]]; then
	export LIQUIBASE_HOME="/opt/homebrew/Cellar/liquibase/4.12.0/libexec"
fi