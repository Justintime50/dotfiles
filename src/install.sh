#!/bin/bash

echo "Installing dotfiles..."
git clone https://github.com/Justintime50/dotfiles.git "$HOME" > /dev/null 2>&1
cp -a "$HOME"/dotfiles/src/home/. "$HOME" # copy home dir files
# sudo cp -a "$HOME"/dotfiles/src/hosts /etc/hosts # copy hosts file
rm -rf "$HOME"/dotfiles
# shellcheck disable=SC1090
source "$HOME"/.zshrc
echo "Dotfiles installed!"
