#!/usr/bin/env zsh

# This script sets up ssh-agent and gpg-agent differently for WSL and non-WSL.

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

# Detect if running inside WSL by checking /proc/version for "Microsoft"
if grep -qi microsoft /proc/version; then
  IS_WSL=true
else
  IS_WSL=false
fi

if [ "$IS_WSL" = true ]; then
  start_keychain "$HOME/.ssh/id_rsa_deadalus" "9DDD59AD62494FB2"
else
  start_keychain "$HOME/.ssh/id_ed25519_nymph" "9DDD59AD62494FB2"
fi

