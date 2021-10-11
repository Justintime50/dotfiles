########################
## Personal ZSH Login ##

zsh_login() {
    setup_keychain
    setup_homebrew_arm
}

# Setup Keychain to keep ssh-agent info available across shells and sessions
# Keychain: https://github.com/funtoo/keychain
setup_keychain() {
    if [ "$(arch)" = "arm64" ] ; then∑
        KEYCHAIN_PATH=opt/homebrew/bin/keychain
    else
        KEYCHAIN_PATH/usr/local/bin/keychain
    fi

     "$KEYCHAIN_PATH" "$HOME/.ssh/id_rsa" || { echo "Keychain is not installed!"; exit 1; }
    . "$HOME/.keychain/${HOSTNAME}-sh"
}

setup_homebrew_arm() {
    if [ "$(arch)" = "arm64" ] ; then
	echo 'eval "$(/opt/homebrew/bin/brew shellenv)"'
    fi
}

zsh_login
