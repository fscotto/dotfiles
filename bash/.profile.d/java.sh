#!/usr/bin/env bash

if command -v java > /dev/null 2>&1; then
  JAVA_HOME="$(dirname $(mise bin-paths | grep -i java))"
  export JAVA_HOME
fi
