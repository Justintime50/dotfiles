###############
## ZSH Login ##

# Keychain: https://github.com/funtoo/keychain
if [[ "$(uname)" == "Darwin" ]]; then
    eval "$(/opt/homebrew/bin/keychain --eval --agents ssh --inherit any id_rsa)"
elif [[ "$(uname)" == "Linux" ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/keychain --eval --agents ssh --inherit any id_rsa)"
fi
