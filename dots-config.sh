# Up/Down Dotfile "Migrations" via Dots

PERSONAL_HOSTNAME="MacBook-Pro-Justin"
EASYPOST_HOSTNAME="MacBook-Pro-Justin-EasyPost"
EASYPOST_AWS_EL6_HOSTNAME="oregon1"
EASYPOST_AWS_EL8_HOSTNAME="oregon2.jhammond.devvm.easypo.net"
SERVER_HOSTNAME="Server"
SERVER2_HOSTNAME="Server2"

dots_config_up() {
    if [[ "$HOSTNAME" == "$PERSONAL_HOSTNAME" ]]; then
        # Shell
        ln -sfn "$DOTFILES_DIR"/src/personal/home/.zlogin "$HOME"/.zlogin
        echo ". $DOTFILES_DIR/src/personal/home/.zshrc" >>"$HOME"/.zshrc
        ln -sfn "$DOTFILES_DIR"/src/personal/home/.gitconfig "$HOME"/.gitconfig
        crontab - <"$DOTFILES_DIR"/src/personal/crontab

        # Emacs
        _install_emacs
        
        # Vim
        _install_vim
    elif [[ "$HOSTNAME" == "$EASYPOST_HOSTNAME" ]]; then
        # Shell
        ln -sfn "$DOTFILES_DIR"/src/personal/home/.zlogin "$HOME"/.zlogin
        echo ". $DOTFILES_DIR/src/personal/home/.zshrc" >>"$HOME"/.zshrc
        echo ". $DOTFILES_DIR/src/easypost/.zshrc" >>"$HOME"/.zshrc
        ln -sfn "$DOTFILES_DIR"/src/personal/home/.gitconfig "$HOME"/.gitconfig
        crontab - <"$DOTFILES_DIR"/src/easypost/crontab
        ln -sfn "$DOTFILES_DIR"/src/easypost/ssh/config "$HOME"/.ssh/config

        # Emacs
        _install_emacs

        # Vim
        _install_vim
    elif [[ "$HOSTNAME" == "$EASYPOST_AWS_EL6_HOSTNAME" || "$HOSTNAME" == "$EASYPOST_AWS_EL8_HOSTNAME" ]]; then
        # Shell
        echo ". $DOTFILES_DIR/src/easypost/.zshrc-aws" >>"$HOME"/.zshrc
        ln -sfn "$DOTFILES_DIR"/src/easypost/.gitconfig-easypost-aws "$HOME"/.gitconfig

        # Emacs
        _install_emacs

        # Vim
        _install_vim
    elif [[ "$HOSTNAME" == *"$SERVER_HOSTNAME"* ]]; then
        # Shell
        ln -sfn "$DOTFILES_DIR"/src/personal/home/.zlogin "$HOME"/.zlogin
        echo ". $DOTFILES_DIR/src/personal/home/.zshrc" >>"$HOME"/.zshrc
        ln -sfn "$DOTFILES_DIR"/src/personal/home/.gitconfig "$HOME"/.gitconfig
        if [[ "$HOSTNAME" == "$SERVER2_HOSTNAME" ]]; then
            crontab - <"$DOTFILES_DIR"/src/server/crontab
        fi

        # Emacs
        _install_emacs

        # Vim
        _install_vim
    else
        echo "HOSTNAME doesn't match any config."
    fi
}

dots_config_down() {
    # `.zshrc` taken care of by Dots for all of these
    if [[ "$HOSTNAME" == "$PERSONAL_HOSTNAME" ]]; then
        # Shell
        rm "$HOME"/.zlogin
        rm "$HOME"/.gitconfig
        crontab -r

        # Emacs
        _uninstall_emacs

        # Vim
        _uninstall_vim
    elif [[ "$HOSTNAME" == "$EASYPOST_HOSTNAME" ]]; then
        # Shell
        rm "$HOME"/.zlogin
        rm "$HOME"/.gitconfig
        crontab -r
        rm -rf "$HOME"/.ssh/config

        # Emacs
        _uninstall_emacs

        # Vim
        _uninstall_vim
    elif [[ "$HOSTNAME" == "$EASYPOST_AWS_EL6_HOSTNAME" || "$HOSTNAME" == "$EASYPOST_AWS_EL8_HOSTNAME" ]]; then
        # Shell
        rm "$HOME"/.gitconfig

        # Emacs
        _uninstall_emacs

        # Vim
        _uninstall_vim
    elif [[ "$HOSTNAME" == *"$SERVER_HOSTNAME"* ]]; then
        # Shell
        rm "$HOME"/.zlogin
        rm "$HOME"/.gitconfig
        crontab -r

        # Emacs
        _uninstall_emacs

        # Vim
        _uninstall_vim
    else
        echo "HOSTNAME doesn't match any config."
    fi
}

_install_emacs() {
    ln -sfn "$DOTFILES_DIR"/src/emacs/.emacs "$HOME"/.emacs
}

_install_vim() {
    mkdir -p "$HOME"/.local/share/nvim/site/pack/packer/start
    ln -sfn "$DOTFILES_DIR"/src/vim/.vimrc "$HOME"/.vimrc
    ln -sfn "$DOTFILES_DIR"/src/vim/.vimrc "$HOME"/.config/nvim/init.vim
    ln -sfn "$DOTFILES_DIR"/src/vim/plugins.lua "$HOME"/.config/nvim/lua/plugins.lua
    ln -sfn "$DOTFILES_DIR"/src/vim/pack/* "$HOME"/.local/share/nvim/site/pack/packer/start
}

_uninstall_emacs() {
    rm "$HOME"/.emacs
}

_uninstall_vim() {
    rm "$HOME"/.vimrc
    rm "$HOME"/.config/nvim/init.vim
    rm "$HOME"/.config/nvim/lua/plugins.lua
    rm -rf "$HOME"/.local/share/nvim/site/pack/packer/start
}
