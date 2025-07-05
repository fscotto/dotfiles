#!/bin/sh
# This script sets up ssh-agent and gpg-agent differently for WSL and Linux Mint.
# On WSL, it uses keychain to start agents.
# On Linux Mint (or other Linux), it assumes gnome-keyring manages agents automatically.

# Detect if running inside WSL by checking /proc/version for "Microsoft"
if grep -qi microsoft /proc/version; then
  IS_WSL=true
else
  IS_WSL=false
fi

if [ "$IS_WSL" = true ]; then
  # We are in WSL - start keychain for ssh and gpg agents
  # Adjust these variables to your actual SSH and GPG key names
  SSH_KEY="$HOME/.ssh/id_rsa_deadalus"
  GPG_KEY=9DDD59AD62494FB2

  # Check if keychain is installed
  if command -v keychain >/dev/null 2>&1; then
    SHORT_HOST=${SHORT_HOST:-${(%):-%m}}
    
    # Start keychain quietly with no GUI prompts for ssh and gpg agents
    eval "$(keychain --quiet --nogui --agents ssh,gpg $SSH_KEY $GPG_KEY)"
    
    # Get the filenames to store/lookup the environment from
    _keychain_env_sh="$HOME/.keychain/$SHORT_HOST-sh"
    _keychain_env_sh_gpg="$HOME/.keychain/$SHORT_HOST-sh-gpg"

    # Source environment settings.
    [ -f "$_keychain_env_sh" ]     && . "$_keychain_env_sh"
    [ -f "$_keychain_env_sh_gpg" ] && . "$_keychain_env_sh_gpg"
  else
    echo "Warning: keychain is not installed. Please install keychain to manage ssh/gpg agents."
  fi
else
  # Not WSL - assume gnome-keyring handles ssh-agent and gpg-agent
  # Do nothing here to avoid conflicts with gnome-keyring
  :
fi

