#!/bin/bash

echo "Installing EasyPost dotfiles..."
mkdir "$HOME"/dotfilestemp && cd "$HOME"/dotfilestemp || exit
git clone https://github.com/Justintime50/dotfiles.git > /dev/null 2>&1
cp -a "$HOME"/dotfilestemp/dotfiles/src/easypost/. "$HOME"
rm -rf "$HOME"/dotfilestemp
rm "$HOME/install.sh"
# shellcheck disable=SC1090
source "$HOME"/.zshrc
echo "EasyPost dotfiles installed!"
