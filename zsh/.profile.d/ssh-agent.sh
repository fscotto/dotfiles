#!/usr/bin/env bash

start_keychain() {
  local ssh_key="$1"
  local gpg_key="$2"
  # Check if keychain is installed
  if command -v keychain >/dev/null 2>&1; then
    SHORT_HOST=${SHORT_HOST:-${(%):-%m}}

    # Start keychain quietly with no GUI prompts for ssh agents
    eval "$(keychain --quiet --nogui $ssh_key $gpg_key)"

    # Get the filenames to store/lookup the environment from
    _keychain_env_sh="$HOME/.keychain/$SHORT_HOST-sh"
    _keychain_env_sh_gpg="$HOME/.keychain/$SHORT_HOST-sh-gpg"

    # Source environment settings.
    [ -f "$_keychain_env_sh" ]     && . "$_keychain_env_sh"
    [ -f "$_keychain_env_sh_gpg" ] && . "$_keychain_env_sh_gpg"
  else
    echo "Warning: keychain is not installed. Please install keychain to manage ssh/gpg agents."
  fi
}

# start_keychain "$HOME/.ssh/id_ed25519_nymph" 
