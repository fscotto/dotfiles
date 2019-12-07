# Load profiles from /etc/profile.d
if test -d $HOME/.profile.d/; then
  for profile in $HOME/.profile.d/*.sh; do
    test -r "$profile" && . "$profile"
  done
  unset profile
fi

