#!/bin/bash
# shellcheck disable=SC1090

echo "Installing dotfiles..."

# Check if dotfiles project exists and clone if not
if [[ ! -d "$HOME"/dotfiles ]] ; then
    git clone https://github.com/Justintime50/dotfiles.git "$HOME"/dotfiles > /dev/null 2>&1
else
    cd "$HOME"/dotfiles || exit
    git pull
    cd || exit
fi

# Install dotfiles
cp -a "$HOME"/dotfiles/src/home/. "$HOME" # copy home dir files
# sudo cp -a "$HOME"/dotfiles/src/hosts /etc/hosts # copy hosts file

# Cleanup
source "$HOME"/.zshrc
echo "Dotfiles installed!"
