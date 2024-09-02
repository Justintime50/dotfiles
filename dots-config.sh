# Up/Down Dotfile "Migrations" via Dots

PERSONAL_HOSTNAME="MacBook-Pro-Justin"
EASYPOST_HOSTNAME="MacBook-Pro-Justin-EasyPost"
EASYPOST_AWS_OREGON3_HOSTNAME="oregon3.jhammond.devvm.easypo.net"
SERVER1_HOSTNAME="Server1"
SERVER2_HOSTNAME="Server2"

dots_config_up() {
    if [[ "$HOSTNAME" == "$PERSONAL_HOSTNAME" ]]; then
        # Submodules
        _install_submodules

        # Shell
        ln -sfn "$DOTFILES_DIR"/src/personal/home/.zlogin "$HOME"/.zlogin
        echo ". $DOTFILES_DIR/src/personal/home/.zshrc" >>"$HOME"/.zshrc
        ln -sfn "$DOTFILES_DIR"/src/personal/home/.gitconfig "$HOME"/.gitconfig
        crontab - <"$DOTFILES_DIR"/src/personal/crontab

        # Text Editors
        _install_emacs
        _install_vim
    elif [[ "$HOSTNAME" == "$EASYPOST_HOSTNAME" ]]; then
        # Submodules
        _install_submodules

        # Shell
        ln -sfn "$DOTFILES_DIR"/src/personal/home/.zlogin "$HOME"/.zlogin
        echo ". $DOTFILES_DIR/src/personal/home/.zshrc" >>"$HOME"/.zshrc
        echo ". $DOTFILES_DIR/src/easypost/.zshrc" >>"$HOME"/.zshrc
        ln -sfn "$DOTFILES_DIR"/src/personal/home/.gitconfig "$HOME"/.gitconfig
        crontab - <"$DOTFILES_DIR"/src/easypost/crontab
        ln -sfn "$DOTFILES_DIR"/src/easypost/ssh/config "$HOME"/.ssh/config

        # Text Editors
        _install_emacs
        _install_vim
    elif [[ "$HOSTNAME" == "$EASYPOST_AWS_OREGON3_HOSTNAME" ]]; then
        # Submodules
        _install_submodules

        # Shell
        echo ". $DOTFILES_DIR/src/easypost/.zshrc-aws" >>"$HOME"/.zshrc
        ln -sfn "$DOTFILES_DIR"/src/easypost/.gitconfig-easypost-aws "$HOME"/.gitconfig
        if [[ "$HOSTNAME" == "$EASYPOST_AWS_OREGON3_HOSTNAME" ]]; then
            crontab - <"$DOTFILES_DIR"/src/easypost/crontab-devvm
        fi

        # Text Editors
        _install_emacs
        _install_vim
    elif [[ "$HOSTNAME" == "Server"* ]]; then
        # Submodules
        _install_submodules

        # Shell
        ln -sfn "$DOTFILES_DIR"/src/personal/home/.zlogin "$HOME"/.zlogin
        echo ". $DOTFILES_DIR/src/personal/home/.zshrc" >>"$HOME"/.zshrc
        ln -sfn "$DOTFILES_DIR"/src/personal/home/.gitconfig "$HOME"/.gitconfig
        if [[ "$HOSTNAME" == "$SERVER1_HOSTNAME" ]]; then
            crontab - <"$DOTFILES_DIR"/src/server1/crontab
            ln -sfn "$DOTFILES_DIR"/src/server1/login-commands.sh "$HOME"/login-commands.sh
        fi
        if [[ "$HOSTNAME" == "$SERVER2_HOSTNAME" ]]; then
            crontab - <"$DOTFILES_DIR"/src/server2/crontab
            ln -sfn "$DOTFILES_DIR"/src/server2/login-commands.sh "$HOME"/login-commands.sh
            ln -sfn "$DOTFILES_DIR"/src/server2/docker-cron-jobs.sh "$HOME"/docker-cron-jobs.sh
        fi

        # Text Editors
        _install_emacs
        _install_vim
    else
        echo "HOSTNAME doesn't match any config."
    fi
}

dots_config_down() {
    # `.zshrc` taken care of by Dots for all of these
    if [[ "$HOSTNAME" == "$PERSONAL_HOSTNAME" ]]; then
        # Shell
        rm -f "$HOME"/.zlogin
        rm -f "$HOME"/.gitconfig
        crontab -r

        # Text Editors
        _uninstall_emacs
        _uninstall_vim
    elif [[ "$HOSTNAME" == "$EASYPOST_HOSTNAME" ]]; then
        # Shell
        rm -f "$HOME"/.zlogin
        rm -f "$HOME"/.gitconfig
        crontab -r
        rm -rf "$HOME"/.ssh/config

        # Text Editors
        _uninstall_emacs
        _uninstall_vim
    elif [[ "$HOSTNAME" == "$EASYPOST_AWS_OREGON3_HOSTNAME" ]]; then
        # Shell
        rm -f "$HOME"/.gitconfig

        # Text Editors
        _uninstall_emacs
        _uninstall_vim
    elif [[ "$HOSTNAME" == "Server"* ]]; then
        # Shell
        rm -f "$HOME"/.zlogin
        rm -f "$HOME"/.gitconfig
        rm -f "$HOME"/login-commands.sh
        rm -f "$HOME"/docker-cron-jobs.sh
        crontab -r

        # Text Editors
        _uninstall_emacs
        _uninstall_vim
    else
        echo "HOSTNAME doesn't match any config."
    fi
}

_install_submodules() {
    git -C "$DOTFILES_DIR" submodule init
    git -C "$DOTFILES_DIR" submodule update
}

_install_emacs() {
    ln -sfn "$DOTFILES_DIR"/src/emacs/.emacs "$HOME"/.emacs
}

_install_vim() {
    # Setup directories prior to linking (helpful for new machines)
    mkdir -p "$HOME"/.config/nvim/lua
    mkdir -p "$HOME"/.local/share/nvim/site/pack/packer/start

    # Link items
    ln -sfn "$DOTFILES_DIR"/src/vim/.vimrc "$HOME"/.vimrc # legacy
    ln -sfn "$DOTFILES_DIR"/src/vim/.vimrc "$HOME"/.config/nvim/init.vim
    ln -sfn "$DOTFILES_DIR"/src/vim/plugins.lua "$HOME"/.config/nvim/lua/plugins.lua
    ln -sfn "$DOTFILES_DIR"/src/vim/pack/* "$HOME"/.local/share/nvim/site/pack/packer/start
}

_uninstall_emacs() {
    rm -f "$HOME"/.emacs
}

_uninstall_vim() {
    rm -f "$HOME"/.vimrc
    rm -f "$HOME"/.config/nvim/init.vim
    rm -f "$HOME"/.config/nvim/lua/plugins.lua
    rm -rf "$HOME"/.local/share/nvim/site/pack/packer/start
}
