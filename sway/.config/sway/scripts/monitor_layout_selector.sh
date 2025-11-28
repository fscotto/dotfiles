#!/bin/sh

CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/wlr-layouts"
LAYOUT_TOOL="wlr-randr"

mkdir -p "$CONFIG_DIR"

# Verifica che fzf sia installato
if ! command -v fzf > /dev/null 2>&1; then
  echo "Errore: fzf non è installato." >&2
  exit 1
fi

# Verifica che fyi sia installato
if ! command -v fyi > /dev/null 2>&1; then
  echo "Errore: fyi non è installato." >&2
  exit 1
fi

# Funzione: applica layout selezionato
apply_layout() {
  local layout_file="$1"
  if [ -f "$layout_file" ]; then
    while IFS= read -r line; do
      [ -n "$line" ] && eval "$line"
    done < "$layout_file"
    fyi "Applied layout: $(basename "$layout_file")"
  else
    echo "File layout non trovato: $layout_file" >&2
    exit 2
  fi
}

# Seleziona layout via fzf con preview
SELECTED_FILE=$(find "$CONFIG_DIR" -type f -name '*.layout' \
  | fzf --prompt="Select layout > " \
    --preview="cat {}" \
    --preview-window=down:50%:wrap)

# Applica se selezionato
if [ -n "$SELECTED_FILE" ]; then
  apply_layout "$SELECTED_FILE"
fi
