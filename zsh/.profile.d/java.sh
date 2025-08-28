#!/usr/bin/env bash

if command -v java > /dev/null 2>&1; then
  export JAVA_HOME="$(dirname $(mise bin-paths | grep -i java))"
fi
