#############
## ZSH Env ##

# Keychain: https://github.com/funtoo/keychain
if [[ "$(uname)" == "Darwin" ]]; then
    # v2.8
    # eval "$(/opt/homebrew/bin/keychain --quick --quiet --eval --agents ssh --inherit any id_rsa)"
    # v2.9+
    eval "$(/opt/homebrew/bin/keychain --eval --ssh-allow-forwarded id_rsa)"
elif [[ "$(uname)" == "Linux" ]]; then
    # v2.8
    # eval "$(/home/linuxbrew/.linuxbrew/bin/keychain --quick --quiet --eval --agents ssh --inherit any id_rsa)"k
    # v2.9+
    eval "$(/home/linuxbrew/.linuxbrew/bin/keychain --eval --ssh-allow-forwarded id_rsa)"
fi
