set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME

if not contains $HOME/.cabal/bin $PATH
    set -x PATH $HOME/.cabal/bin $PATH
end

if not contains $HOME/.ghcup/bin $PATH
    set -x PATH $HOME/.ghcup/bin
end
