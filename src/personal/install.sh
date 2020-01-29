#/!bin/bash

echo "Installing personal dotfiles..."
mkdir "$HOME"/temp && cd "$HOME"/temp || exit
git clone https://github.com/Justintime50/dotfiles.git > /dev/null 2>&1
cp -a "$HOME"/temp/dotfiles/src/personal/. "$HOME"
rm -rf "$HOME"/temp
rm "$HOME/install.sh"
echo "Personal dotfiles installed!"
