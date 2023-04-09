# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/profile.pre.bash" ]] && builtin source "$HOME/.fig/shell/profile.pre.bash"

# Load profiles from /etc/profile.d
if test -d $HOME/.profile.d/; then
  for profile in $HOME/.profile.d/*.sh; do
    test -r "$profile" && . "$profile"
  done
  unset profile
fi

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/profile.post.bash" ]] && builtin source "$HOME/.fig/shell/profile.post.bash"
. "$HOME/.cargo/env"
