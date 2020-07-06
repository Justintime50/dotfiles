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
# Personal install
echo "Install personal dotfiles? (y/N)"
read -r PERSONAL
case $PERSONAL in
    y|Y) echo "Installing personal dotfiles..." ;;
    n|N) echo "Skipping personal dotfiles." ;;
esac

if [[ $PERSONAL = "y" || $PERSONAL = "Y" ]] ; then
    ln -s "$HOME"/dotfiles/src/personal/home/.gitconfig "$HOME"/.gitconfig
    # ln -s "$HOME"/dotfiles/src/personal/misc/hosts /etc/hosts
    echo "source $HOME/dotfiles/src/personal/.zshrc" >> ~/.zshrc
    echo "Personal dotfiles installed!" ;;
fi
    
# EasyPost install
echo "Install EasyPost dotfiles? (y/N)"
read -r EASYPOST
case $EASYPOST in
    y|Y) echo "Installing EasyPost dotfiles..." ;;
    n|N) echo "Skipping EasyPost dotfiles." ;;
esac

if [[ $EASYPOST = "y" || $EASYPOST = "Y" ]] ; then
    ln -s "$HOME"/dotfiles/src/easypost/.gitconfig-easypost "$HOME"/.gitconfig-easypost
    ln -s "$HOME"/dotfiles/src/easypost/ssh/config "$HOME"/.ssh/config
    echo "source $HOME/dotfiles/src/easypost/.zshrc" >> ~/.zshrc
    echo "EasyPost dotfiles installed!" ;;
fi

# Source core files
source "$HOME"/.zshrc
