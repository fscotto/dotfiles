#!/usr/bin/env sh

mbsync -a & pid1=$!
wait $pid1

mu index

