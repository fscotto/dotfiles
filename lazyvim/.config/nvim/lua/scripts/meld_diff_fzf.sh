#!/bin/sh

file1=$(fzf --prompt="Select first file: " < <(find . -type f))
[ -z "$file1" ] && echo "Aborted." && exit 1

file2=$(fzf --prompt="Select second file: " < <(find . -type f))
[ -z "$file2" ] && echo "Aborted." && exit 1

echo "🔍 Comparing:"
echo "  1: $file1"
echo "  2: $file2"

meld "$file1" "$file2" &
