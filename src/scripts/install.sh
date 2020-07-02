#!/bin/bash
# shellcheck disable=SC1090

# Check if dotfiles project exists and clone if not
echo "Installing dotfiles..."
if [[ ! -d "$HOME"/dotfiles ]] ; then
    git clone https://github.com/Justintime50/dotfiles.git "$HOME"/dotfiles > /dev/null 2>&1
else
    git -C "$HOME"/dotfiles pull
fi

# Install dotfiles
ln -s "$HOME"/dotfiles/src/home/.zshrc "$HOME"/.zshrc
ln -s "$HOME"/dotfiles/src/home/.gitconfig "$HOME"/.gitconfig
ln -s "$HOME"/dotfiles/src/home/.gitconfig-easypost "$HOME"/.gitconfig-easypost
# ln -s "$HOME"/dotfiles/src/misc/hosts /etc/hosts

# Cleanup
source "$HOME"/.zshrc
echo "Dotfiles installed!"
