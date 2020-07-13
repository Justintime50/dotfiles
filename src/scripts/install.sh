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
cp "$HOME"/dotfiles/src/core/.zshrc-core "$HOME"/.zshrc # Install the global "~/.zshrc which will source the rest"

# Iterate through each set of dotfiles to install
# Personal install
echo "Install personal dotfiles? (y/N)"
read -r PERSONAL
case $PERSONAL in
    y|Y ) echo "Installing personal dotfiles..." ;;
    n|N ) echo "Skipping personal dotfiles." ;;
    * ) echo "Y or N input required"; exit 1 ;;
esac

if [[ $PERSONAL = "y" || $PERSONAL = "Y" ]] ; then
    ln -s "$HOME"/dotfiles/src/personal/home/.gitconfig "$HOME"/.gitconfig
    # ln -s "$HOME"/dotfiles/src/personal/misc/hosts /etc/hosts
    echo "source $HOME/dotfiles/src/personal/home/.zshrc" >> ~/.zshrc
    echo "Personal dotfiles installed!"
fi
    
# EasyPost install
echo "Install EasyPost dotfiles? (y/N)"
read -r EASYPOST
case $EASYPOST in
    y|Y ) echo "Installing EasyPost dotfiles..." ;;
    n|N ) echo "Skipping EasyPost dotfiles." ;;
    * ) echo "Y or N input required"; exit 1 ;;
esac

if [[ $EASYPOST = "y" || $EASYPOST = "Y" ]] ; then
    ln -s "$HOME"/dotfiles/src/easypost/.gitconfig-easypost "$HOME"/.gitconfig-easypost
    ln -s "$HOME"/dotfiles/src/easypost/ssh/config "$HOME"/.ssh/config
    echo "source $HOME/dotfiles/src/easypost/.zshrc" >> ~/.zshrc
    echo "EasyPost dotfiles installed!"
fi

# Emacs install
echo "Install Emacs dotfiles? (y/N)"
read -r EMACS
case $EMACS in
    y|Y ) echo "Installing Emacs dotfiles..." ;;
    n|N ) echo "Skipping Emacs dotfiles." ;;
    * ) echo "Y or N input required"; exit 1 ;;
esac

if [[ $EMACS = "y" || $EMACS = "Y" ]] ; then
    ln -s "$HOME"/dotfiles/src/emacs/.emacs "$HOME"/.emacs
    echo "EasyPost dotfiles installed!"
fi

# Source core files
source "$HOME"/.zshrc
