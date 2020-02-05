#!/bin/bash

echo "Installing dotfiles..."
mkdir "$HOME"/dotfilestemp && cd "$HOME"/dotfilestemp || exit
git clone https://github.com/Justintime50/dotfiles.git > /dev/null 2>&1
cp -a "$HOME"/dotfilestemp/dotfiles/src/home/. "$HOME" # copy home dir files
cp -a "$HOME"/dotfilestemp/dotfiles/src/hosts /etc/hosts # copy hosts file
rm -rf "$HOME"/dotfilestemp
rm "$HOME/install.sh"
echo "Dotfiles installed!"
