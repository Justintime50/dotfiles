#!/bin/bash
# shellcheck disable=SC1090

DOTFILES_DIR="$HOME/dotfiles"

install_core() {
    # Pull the dotfiles project if it exists, clone if it does not
    echo "Installing dotfiles..."
    if [[ ! -d "$DOTFILES_DIR" ]] ; then
        git clone https://github.com/Justintime50/dotfiles.git "$DOTFILES_DIR" > /dev/null 2>&1 || { echo "Error cloning Dotfiles"; exit 1; }
    else
        git -C "$DOTFILES_DIR" pull > /dev/null 2>&1 || { echo "Error pulling Dotfiles"; exit 1; }
    fi

    # Install dotfiles core
    cp "$DOTFILES_DIR"/src/core/.zshrc "$HOME"/.zshrc # Install the global "~/.zshrc which will source the rest"
    LOADED_MODULES_FILE="$DOTFILES_DIR/src/core/loaded-modules.txt"
    [ -f "$LOADED_MODULES_FILE" ] && rm "$LOADED_MODULES_FILE"
    echo "* Core" >> "$LOADED_MODULES_FILE"
}

prompt_dotfile_modules() {
    # Iterate through each set of dotfiles prompting which to install
    prompt_personal_module
    prompt_easypost_module
    prompt_easypost_aws_module
    prompt_emacs_module
    prompt_server_module
}

prompt_personal_module() {
    echo "Install personal dotfiles? (y/N)"
    read -r PERSONAL_MODULE
    case $PERSONAL_MODULE in
        y|Y ) echo "Installing personal dotfiles..." ;;
        n|N ) echo "Skipping personal dotfiles." ;;
        * ) echo "Y or N input required"; exit 1 ;;
    esac
}

prompt_easypost_module() {
    echo "Install EasyPost dotfiles? (y/N)"
    read -r EASYPOST_MODULE
    case $EASYPOST_MODULE in
        y|Y ) echo "Installing EasyPost dotfiles..." ;;
        n|N ) echo "Skipping EasyPost dotfiles." ;;
        * ) echo "Y or N input required"; exit 1 ;;
    esac
}

prompt_easypost_aws_module() {
    echo "Install EasyPost AWS dotfiles? (y/N)"
    read -r EASYPOST_AWS_MODULE
    case $EASYPOST_AWS_MODULE in
        y|Y ) echo "Installing EasyPost AWS dotfiles..." ;;
        n|N ) echo "Skipping EasyPost AWS dotfiles." ;;
        * ) echo "Y or N input required"; exit 1 ;;
    esac
}

prompt_emacs_module() {
    echo "Install Emacs dotfiles? (y/N)"
    read -r EMACS_MODULE
    case $EMACS_MODULE in
        y|Y ) echo "Installing Emacs dotfiles..." ;;
        n|N ) echo "Skipping Emacs dotfiles." ;;
        * ) echo "Y or N input required"; exit 1 ;;
    esac
}

prompt_server_module() {
    echo "Install Server dotfiles? (y/N)"
    read -r SERVER_MODULE
    case $SERVER_MODULE in
        y|Y ) echo "Installing Server dotfiles..." ;;
        n|N ) echo "Skipping Server dotfiles." ;;
        * ) echo "Y or N input required"; exit 1 ;;
    esac
}

install_modules() {
    # Based on input, install dotfiles
    case $PERSONAL_MODULE in y|Y )
        install_personal_module ;;
    esac
    case $EASYPOST_MODULE in y|Y )
        install_easypost_module ;;
    esac
    case $EASYPOST_AWS_MODULE in y|Y )
        install_easypost_aws_module ;;
    esac
    case $EMACS_MODULE in y|Y )
        install_emacs_module ;;
    esac
    case $SERVER_MODULE in y|Y )
        install_server_module ;;
    esac
}

install_personal_module() {
    ln -sfn "$DOTFILES_DIR"/src/personal/home/.gitconfig "$HOME"/.gitconfig
    ln -sfn "$DOTFILES_DIR"/src/personal/home/.zlogin "$HOME"/.zlogin
    # ln -sfn "$DOTFILES_DIR"/src/personal/misc/hosts /etc/hosts
    echo "source $DOTFILES_DIR/src/personal/home/.zshrc" >> "$HOME"/.zshrc
    echo "* Personal" >> "$LOADED_MODULES_FILE"
    echo "Personal dotfiles installed!"
}

install_easypost_module() {
    ln -sfn "$DOTFILES_DIR"/src/easypost/.gitconfig-easypost "$HOME"/.gitconfig-easypost
    ln -sfn "$DOTFILES_DIR"/src/easypost/ssh/config "$HOME"/.ssh/config
    echo "source $DOTFILES_DIR/src/easypost/.zshrc" >> "$HOME"/.zshrc
    echo "* EasyPost" >> "$LOADED_MODULES_FILE"        
    echo "EasyPost dotfiles installed!"
}

install_easypost_aws_module() {
    ln -sfn "$DOTFILES_DIR"/src/easypost/.gitconfig-easypost-aws "$HOME"/.gitconfig
    echo "* EasyPost AWS" >> "$LOADED_MODULES_FILE"        
    echo "EasyPost AWS dotfiles installed!"
}

install_emacs_module() {
    ln -sfn "$DOTFILES_DIR"/src/emacs/.emacs "$HOME"/.emacs
    echo "* Emacs" >> "$LOADED_MODULES_FILE"
    echo "Emacs dotfiles installed!"
}

install_server_module() {
    cat "$DOTFILES_DIR"/src/server/crontab | crontab -
    echo "* Server" >> "$LOADED_MODULES_FILE"
    echo "Server dotfiles installed!"
}

cleanup() {
    # Source Dotfiles after installation
    . "$HOME"/.zshrc
}

# Run the installation script functions
install_core
prompt_dotfile_modules
install_modules
cleanup
