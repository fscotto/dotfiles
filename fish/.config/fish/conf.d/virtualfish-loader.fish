set -g VIRTUALFISH_VERSION 2.5.9
switch (uname -s)
    case Darwin
        set -g VIRTUALFISH_PYTHON_EXEC /opt/homebrew/Cellar/virtualfish/2.5.9/libexec/bin/python
        source /opt/homebrew/Cellar/virtualfish/2.5.9/libexec/lib/python3.12/site-packages/virtualfish/virtual.fish
    case Linux
        set -g VIRTUALFISH_PYTHON_EXEC /usr/bin/python
        source $HOME/.local/lib/python3.12/site-packages/virtualfish/virtual.fish
end
emit virtualfish_did_setup_plugins
