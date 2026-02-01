#!/usr/bin/env sh

# Load Mise en dev
if command -v mise > /dev/null 2>&1; then
    eval "$(mise activate bash)"

    if mise ls | grep -i java; then
	JAVA_HOME="$(dirname $(mise bin-paths | grep -i java))"
	export JAVA_HOME
    fi
fi
