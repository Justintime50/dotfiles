########################
## Personal ZSH Login ##

# Setup Keychain to keep ssh-agent info available across shells and sessions
# Keychain: https://github.com/funtoo/keychain
# TODO: Run a check here to ensure Keychain is installed and running, warn if not
/usr/local/bin/keychain "$HOME/.ssh/id_rsa"
. "$HOME/.keychain/${HOSTNAME}-sh"
