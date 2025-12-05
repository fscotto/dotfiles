#!/usr/bin/env sh

mbsync Gmail & pid1=$!
wait $pid1

mu index

