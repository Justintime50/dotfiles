########################
## Personal ZSH Login ##

zsh_login() {
    # setup_homebrew_arm
    setup_keychain
}

# Evaluates the new location of Homebrew for arm64 machines
# Unused at the moment due to adding the new homebrew bin to $PATH
setup_homebrew_arm() {
    eval "$(/opt/homebrew/bin/brew shellenv)"
}

# Setup Keychain to keep ssh-agent info available across shells and sessions
# Keychain: https://github.com/funtoo/keychain
setup_keychain() {
    "$(which keychain)" "$HOME/.ssh/id_rsa" || echo "Keychain is not installed correctly!"
    . "$HOME/.keychain/${HOSTNAME}-sh" || echo "Keychain is not configured correctly!"
}

zsh_login
