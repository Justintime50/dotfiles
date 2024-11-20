# Up/Down Dotfile "Migrations" via Dots

PERSONAL_HOSTNAME="mbp-justin"
EASYPOST_HOSTNAME="mbp-justin-ep"
EASYPOST_AWS_OREGON3_HOSTNAME="oregon3.jhammond.devvm.easypo.net"
LB1_HOSTNAME="lb1"
WEB1_HOSTNAME="web1"
WEB2_HOSTNAME="web2"
DB1_HOSTNAME="db1"
DB2_HOSTNAME="db2"
DEV1_HOSTNAME="dev1"
SERVER_HOSTNAMES=("$LB1_HOSTNAME" "$WEB1_HOSTNAME" "$WEB2_HOSTNAME" "$DB1_HOSTNAME" "$DB2_HOSTNAME" "$DEV1_HOSTNAME")

dots_config_up() {
    # Always install general shell config
    echo ". $DOTFILES_DIR/src/shell/.zshrc" >>"$HOME"/.zshrc
    ln -sfn "$DOTFILES_DIR/src/shell/.tmux.conf" "$HOME"/.tmux.conf

    if [[ "$HOSTNAME" == "$PERSONAL_HOSTNAME" ]]; then
        # Submodules
        _install_submodules

        # Shell
        ln -sfn "$DOTFILES_DIR"/src/shell/.zshenv "$HOME"/.zshenv
        echo ". $DOTFILES_DIR/src/personal/home/.zshrc" >>"$HOME"/.zshrc
        ln -sfn "$DOTFILES_DIR"/src/personal/home/.gitconfig "$HOME"/.gitconfig
        crontab - <"$DOTFILES_DIR"/src/personal/crontab
        ln -sfn "$DOTFILES_DIR"/src/personal/ssh/config "$HOME"/.ssh/config

        # Docker
        ln -sfn "$DOTFILES_DIR"/src/personal/home/docker-daemon.json "$HOME"/.docker/daemon.json

        # Text Editors
        _install_emacs
        _install_vim
    elif [[ "$HOSTNAME" == "$EASYPOST_HOSTNAME" ]]; then
        # Submodules
        _install_submodules

        # Shell
        ln -sfn "$DOTFILES_DIR"/src/shell/.zshenv "$HOME"/.zshenv
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
        ln -sfn "$DOTFILES_DIR"/src/easypost/.gitconfig-easypost-aws "$HOME"/.gitconfig
        if [[ "$HOSTNAME" == "$EASYPOST_AWS_OREGON3_HOSTNAME" ]]; then
            crontab - <"$DOTFILES_DIR"/src/easypost/crontab-devvm
        fi

        # Text Editors
        _install_emacs
        _install_vim
    elif [[ " ${SERVER_HOSTNAMES[*]} " == *" ${HOSTNAME} "* ]]; then
        # Submodules
        _install_submodules

        # Shell
        echo ". $DOTFILES_DIR/src/servers/.zshrc" >>"$HOME"/.zshrc
        ln -sfn "$DOTFILES_DIR"/src/personal/home/.gitconfig "$HOME"/.gitconfig

        # Config
        sudo ln -sfn "$DOTFILES_DIR"/src/servers/sshd_config /etc/ssh/sshd_config.d/50-server.conf
        sudo ln -sfn "$DOTFILES_DIR"/src/servers/polkit-rules /etc/polkit-1/rules.d

        # Docker
        sudo ln -sfn "$DOTFILES_DIR"/src/servers/docker-daemon.json /etc/docker/daemon.json

        # Crontabs
        if [[ "$HOSTNAME" == "$LB1_HOSTNAME" ]]; then
            crontab - <"$DOTFILES_DIR"/src/servers/lb1/lb1.crontab
        fi
        if [[ "$HOSTNAME" == "$WEB1_HOSTNAME" ]]; then
            crontab - <"$DOTFILES_DIR"/src/servers/web1/web1.crontab
            ln -sfn "$DOTFILES_DIR"/src/servers/docker-cron-jobs.sh "$HOME"/docker-cron-jobs.sh
        fi
        if [[ "$HOSTNAME" == "$WEB2_HOSTNAME" ]]; then
            crontab - <"$DOTFILES_DIR"/src/servers/web2/web2.crontab
        fi
        if [[ "$HOSTNAME" == "$DB1_HOSTNAME" ]]; then
            crontab - <"$DOTFILES_DIR"/src/servers/db1/db1.crontab
        fi
        if [[ "$HOSTNAME" == "$DB2_HOSTNAME" ]]; then
            crontab - <"$DOTFILES_DIR"/src/servers/db2/db2.crontab
        fi
        if [[ "$HOSTNAME" == "$DEV1_HOSTNAME" ]]; then
            crontab - <"$DOTFILES_DIR"/src/servers/dev1/dev1.crontab
        fi

        # Text Editors
        _install_vim
    else
        echo "HOSTNAME doesn't match any config."
    fi
}

dots_config_down() {
    # Remove generic shell config from all machines
    rm -f "$HOME"/.zshrc
    rm -f "$HOME"/.zshenv
    rm -f "$HOME"/.tmux.conf

    if [[ "$HOSTNAME" == "$PERSONAL_HOSTNAME" ]]; then
        # Shell
        rm -f "$HOME"/.gitconfig
        crontab -r

        # Text Editors
        _uninstall_emacs
        _uninstall_vim
    elif [[ "$HOSTNAME" == "$EASYPOST_HOSTNAME" ]]; then
        # Shell
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
    elif [[ " ${SERVER_HOSTNAMES[*]} " == *" ${HOSTNAME} "* ]]; then
        # Shell
        rm -f "$HOME"/.gitconfig

        # TODO: Clean up config and docker files

        # Text Editors
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
