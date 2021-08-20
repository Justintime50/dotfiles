########################
## Personal ZSH Login ##

zsh_login() {
    setup_keychain
}

# Setup Keychain to keep ssh-agent info available across shells and sessions
# Keychain: https://github.com/funtoo/keychain
setup_keychain() {
    /usr/local/bin/keychain "$HOME/.ssh/id_rsa" || { echo "Keychain is not installed!"; exit 1; }
    . "$HOME/.keychain/${HOSTNAME}-sh"
}

zsh_login
