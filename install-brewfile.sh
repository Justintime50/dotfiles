#!/bin/bash

install_brewfile() {
    # Install packages from Brewfile (generated by Alchemist)
    if [[ "$HOSTNAME" == "MacBook-Pro-Justin" ]]; then
        brew bundle --file "$HOME/.dotfiles/src/personal/Brewfile"
    elif [[ "$HOSTNAME" == *"Server"* ]]; then
        brew bundle --file "$HOME/.dotfiles/src/server/Brewfile"
    elif [[ "$HOSTNAME" == "MacBook-Pro-Justin-EasyPost" ]]; then
        brew bundle --file "$HOME/.dotfiles/src/easypost/Brewfile"
    else
        echo "HOSTNAME doesn't match any config for Brewfile installation."
    fi
}

install_brewfile
