#!/bin/bash
# shellcheck disable=SC1090

# Check if dotfiles project exists and clone if not
echo "Installing dotfiles..."
if [[ ! -d "$HOME"/dotfiles ]] ; then
    git clone https://github.com/Justintime50/dotfiles.git "$HOME"/dotfiles > /dev/null 2>&1
else
    git -C "$HOME"/dotfiles pull
fi

# Install dotfiles core
# NOTE: This will require some manual tweaks once installed
cp "$HOME"/dotfiles/src/core/.zshrc-core "$HOME"/.zshrc # Install the global "~/.zshrc which will source the rest"

# Iterate through each set of dotfiles to install
while [[ "$#" -gt 0 ]]; do
    case $1 in
        # Personal install
        -p|--personal)
            ln -s "$HOME"/dotfiles/src/personal/home/.gitconfig "$HOME"/.gitconfig
            # ln -s "$HOME"/dotfiles/src/personal/misc/hosts /etc/hosts
            echo "Personal dotfiles installed!" ;;
        # EasyPost install
        -e|--easypost) 
            ln -s "$HOME"/dotfiles/src/easypost/.gitconfig-easypost "$HOME"/.gitconfig-easypost
            ln -s "$HOME"/dotfiles/src/easypost/ssh/config "$HOME"/.ssh/config
            echo "EasyPost dotfiles installed!" ;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

# Source core files
source "$HOME"/.zshrc
