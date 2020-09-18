#!/bin/bash
# shellcheck disable=SC1090

# Check if dotfiles project exists and clone if not
echo "Installing dotfiles..."
if [[ ! -d "$HOME"/dotfiles ]] ; then
    git clone https://github.com/Justintime50/dotfiles.git "$HOME"/dotfiles > /dev/null 2>&1 || { echo "Error cloning Dotfiles"; exit 1; }
else
    git -C "$HOME"/dotfiles pull > /dev/null 2>&1 || { echo "Error pulling Dotfiles"; exit 1; }
fi

# Install dotfiles core
cp "$HOME"/dotfiles/src/core/.zshrc "$HOME"/.zshrc # Install the global "~/.zshrc which will source the rest"
LOADED_MODULES_FILE="$HOME/dotfiles/src/core/loaded-modules.txt"
[ -f "$LOADED_MODULES_FILE" ] && rm "$LOADED_MODULES_FILE"
echo "* Core" >> "$LOADED_MODULES_FILE"

# Iterate through each set of dotfiles prompting which to install
echo "Install personal dotfiles? (y/N)"
read -r PERSONAL
case $PERSONAL in
    y|Y ) echo "Installing personal dotfiles..." ;;
    n|N ) echo "Skipping personal dotfiles." ;;
    * ) echo "Y or N input required"; exit 1 ;;
esac

echo "Install EasyPost dotfiles? (y/N)"
read -r EASYPOST
case $EASYPOST in
    y|Y ) echo "Installing EasyPost dotfiles..." ;;
    n|N ) echo "Skipping EasyPost dotfiles." ;;
    * ) echo "Y or N input required"; exit 1 ;;
esac

echo "Install Emacs dotfiles? (y/N)"
read -r EMACS
case $EMACS in
    y|Y ) echo "Installing Emacs dotfiles..." ;;
    n|N ) echo "Skipping Emacs dotfiles." ;;
    * ) echo "Y or N input required"; exit 1 ;;
esac

# Based on input, install dotfiles
if [[ $PERSONAL = "y" || $PERSONAL = "Y" ]] ; then
    ln -sfn "$HOME"/dotfiles/src/personal/home/.gitconfig "$HOME"/.gitconfig
    # ln -sfn "$HOME"/dotfiles/src/personal/misc/hosts /etc/hosts
    echo "source $HOME/dotfiles/src/personal/home/.zshrc" >> "$HOME"/.zshrc
    echo "* Personal" >> "$LOADED_MODULES_FILE"
    echo "Personal dotfiles installed!"
fi

if [[ $EASYPOST = "y" || $EASYPOST = "Y" ]] ; then
    ln -sfn "$HOME"/dotfiles/src/easypost/.gitconfig-easypost "$HOME"/.gitconfig-easypost
    ln -sfn "$HOME"/dotfiles/src/easypost/ssh/config "$HOME"/.ssh/config
    echo "source $HOME/dotfiles/src/easypost/.zshrc" >> "$HOME"/.zshrc
    echo "* EasyPost" >> "$LOADED_MODULES_FILE"        
    echo "EasyPost dotfiles installed!"
fi

if [[ $EMACS = "y" || $EMACS = "Y" ]] ; then
    ln -sfn "$HOME"/dotfiles/src/emacs/.emacs "$HOME"/.emacs
    echo "* Emacs" >> "$LOADED_MODULES_FILE"
    echo "EasyPost dotfiles installed!"
fi

# Source core files
source "$HOME"/.zshrc
