#############
## ZSH Env ##

# Keychain: https://github.com/funtoo/keychain
if [[ "$(uname)" == "Darwin" ]]; then
    eval "$(/opt/homebrew/bin/keychain --quick --quiet --eval --agents ssh --inherit any id_rsa)"
elif [[ "$(uname)" == "Linux" ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/keychain --quick --quiet --eval --agents ssh --inherit any id_rsa)"
fi
