# Up/Down Dotfile "Migrations" via Dots

dots_config_up() {
    # Personal
    if [[ "$HOSTNAME" == "MacBook-Pro-Justin" ]] ; then
        ln -sfn "$DOTFILES_DIR"/src/personal/home/.gitconfig "$HOME"/.gitconfig
        ln -sfn "$DOTFILES_DIR"/src/personal/home/.zlogin "$HOME"/.zlogin
        ln -sfn "$DOTFILES_DIR"/src/emacs/.emacs "$HOME"/.emacs
        echo ". $DOTFILES_DIR/src/personal/home/.zshrc" >> "$HOME"/.zshrc
    # EasyPost local
    elif [[ "$HOSTNAME" == "MacBook-Pro-Justin-EasyPost" ]] ; then
        # ln -sfn "$DOTFILES_DIR"/src/easypost/.gitconfig-easypost "$HOME"/.gitconfig-easypost  # install personal instead
        ln -sfn "$DOTFILES_DIR"/src/personal/home/.gitconfig "$HOME"/.gitconfig
        ln -sfn "$DOTFILES_DIR"/src/easypost/ssh/config "$HOME"/.ssh/config
        ln -sfn "$DOTFILES_DIR"/src/emacs/.emacs "$HOME"/.emacs
        echo ". $DOTFILES_DIR/src/easypost/.zshrc" >> "$HOME"/.zshrc
    # EasyPost AWS
    elif [[ "$HOSTNAME" == "oregon1" ]] ; then
        ln -sfn "$DOTFILES_DIR"/src/easypost/.gitconfig-easypost-aws "$HOME"/.gitconfig
        ln -sfn "$DOTFILES_DIR"/src/emacs/.emacs "$HOME"/.emacs
        echo ". $DOTFILES_DIR/src/easypost/.zshrc-aws" >> "$HOME"/.zshrc
    # Mac mini Server
    elif [[ "$HOSTNAME" == "Server" ]] ; then
        crontab - < "$DOTFILES_DIR"/src/server/crontab
        ln -sfn "$DOTFILES_DIR"/src/emacs/.emacs "$HOME"/.emacs
    else
        echo "HOSTNAME doesn't match any config."
    fi
}

dots_config_down() {
    # Personal
    if [[ "$HOSTNAME" == "MacBook-Pro-Justin" ]] ; then
        rm -i "$HOME"/.gitconfig
        rm -i "$HOME"/.zlogin
        rm -i "$HOME"/.emacs
        # .zshrc taken care of by Dots
    # EasyPost local
    elif [[ "$HOSTNAME" == "MacBook-Pro-Justin-EasyPost" ]] ; then
        rm -i "$HOME"/.gitconfig
	    rm -i -rf "$HOME"/.ssh/config
        rm "$HOME"/.emacs
        # .zshrc taken care of by Dots
    # EasyPost AWS
    elif [[ "$HOSTNAME" == "oregon1" ]] ; then
	    rm -i "$HOME"/.gitconfig
        rm "$HOME"/.emacs
        # .zshrc taken care of by Dots
    # Mac mini Server
    elif [[ "$HOSTNAME" == "Server" ]] ; then
    	crontab - < ""
        rm "$HOME"/.emacs
    else
        echo "HOSTNAME doesn't match any config."
    fi
}
