#!/bin/bash
# shellcheck disable=SC1090

DOTFILES_DIR="$HOME/dotfiles"

function install_core {
    # Pull the dotfiles project if it exists, clone if it does not
    echo "Installing dotfiles..."
    if [[ ! -d "$DOTFILES_DIR" ]] ; then
        git clone https://github.com/Justintime50/dotfiles.git "$DOTFILES_DIR" > /dev/null 2>&1 || { echo "Error cloning Dotfiles"; exit 1; }
    else
        git -C "$DOTFILES_DIR" pull > /dev/null 2>&1 || { echo "Error pulling Dotfiles"; exit 1; }
    fi

    # Install dotfiles core
    ln -sfn "$DOTFILES_DIR"/src/core/.zshrc "$HOME"/.zshrc # Install the global "~/.zshrc which will source the rest"
    LOADED_MODULES_FILE="$DOTFILES_DIR/src/core/loaded-modules.txt"
    [ -f "$LOADED_MODULES_FILE" ] && rm "$LOADED_MODULES_FILE"
    echo "* Core" >> "$LOADED_MODULES_FILE"
}

function prompt_dotfile_modules {
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

    echo "Install EasyPost AWS dotfiles? (y/N)"
    read -r EASYPOST_AWS
    case $EASYPOST_AWS in
        y|Y ) echo "Installing EasyPost AWS dotfiles..." ;;
        n|N ) echo "Skipping EasyPost AWS dotfiles." ;;
        * ) echo "Y or N input required"; exit 1 ;;
    esac

    echo "Install Emacs dotfiles? (y/N)"
    read -r EMACS
    case $EMACS in
        y|Y ) echo "Installing Emacs dotfiles..." ;;
        n|N ) echo "Skipping Emacs dotfiles." ;;
        * ) echo "Y or N input required"; exit 1 ;;
    esac
}

function install_modules {
    # Based on input, install dotfiles
    if [[ $PERSONAL = "y" || $PERSONAL = "Y" ]] ; then
        ln -sfn "$DOTFILES_DIR"/src/personal/home/.gitconfig "$HOME"/.gitconfig
        # ln -sfn "$DOTFILES_DIR"/src/personal/misc/hosts /etc/hosts
        echo "source $DOTFILES_DIR/src/personal/home/.zshrc" >> "$HOME"/.zshrc
        echo "* Personal" >> "$LOADED_MODULES_FILE"
        echo "Personal dotfiles installed!"
    fi

    if [[ $EASYPOST = "y" || $EASYPOST = "Y" ]] ; then
        ln -sfn "$DOTFILES_DIR"/src/easypost/.gitconfig-easypost "$HOME"/.gitconfig-easypost
        ln -sfn "$DOTFILES_DIR"/src/easypost/ssh/config "$HOME"/.ssh/config
        echo "source $DOTFILES_DIR/src/easypost/.zshrc" >> "$HOME"/.zshrc
        echo "* EasyPost" >> "$LOADED_MODULES_FILE"        
        echo "EasyPost dotfiles installed!"
    fi

    if [[ $EASYPOST_AWS = "y" || $EASYPOST_AWS = "Y" ]] ; then
        ln -sfn "$DOTFILES_DIR"/src/easypost/.gitconfig-easypost-aws "$HOME"/.gitconfig
        echo "* EasyPost AWS" >> "$LOADED_MODULES_FILE"        
        echo "EasyPost AWS dotfiles installed!"
    fi

    if [[ $EMACS = "y" || $EMACS = "Y" ]] ; then
        ln -sfn "$DOTFILES_DIR"/src/emacs/.emacs "$HOME"/.emacs
        echo "* Emacs" >> "$LOADED_MODULES_FILE"
        echo "Emacs dotfiles installed!"
    fi
}

# Run the installation script functions
install_core
prompt_dotfile_modules
install_modules

# Source Dotfiles after installation
source "$HOME"/.zshrc
