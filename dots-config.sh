# Up/Down Dotfile "Migrations" via Dots

PERSONAL_HOSTNAME="MacBook-Pro-Justin"
EASYPOST_HOSTNAME="MacBook-Pro-Justin-EasyPost"
EASYPOST_AWS_HOSTNAME="oregon1"
SERVER_HOSTNAME="Server"

dots_config_up() {
    if [[ "$HOSTNAME" == "$PERSONAL_HOSTNAME" ]] ; then
        ln -sfn "$DOTFILES_DIR"/src/personal/home/.gitconfig "$HOME"/.gitconfig
        ln -sfn "$DOTFILES_DIR"/src/personal/home/.zlogin "$HOME"/.zlogin
        ln -sfn "$DOTFILES_DIR"/src/emacs/.emacs "$HOME"/.emacs
        
        echo ". $DOTFILES_DIR/src/personal/home/.zshrc" >> "$HOME"/.zshrc
    elif [[ "$HOSTNAME" == "$EASYPOST_HOSTNAME" ]] ; then
        ln -sfn "$DOTFILES_DIR"/src/personal/home/.gitconfig "$HOME"/.gitconfig
        ln -sfn "$DOTFILES_DIR"/src/personal/home/.zlogin "$HOME"/.zlogin
        ln -sfn "$DOTFILES_DIR"/src/easypost/ssh/config "$HOME"/.ssh/config
        ln -sfn "$DOTFILES_DIR"/src/emacs/.emacs "$HOME"/.emacs
        
        echo ". $DOTFILES_DIR/src/personal/home/.zshrc" >> "$HOME"/.zshrc
        echo ". $DOTFILES_DIR/src/easypost/.zshrc" >> "$HOME"/.zshrc
    elif [[ "$HOSTNAME" == "$EASYPOST_AWS_HOSTNAME" ]] ; then
        ln -sfn "$DOTFILES_DIR"/src/easypost/.gitconfig-easypost-aws "$HOME"/.gitconfig
        ln -sfn "$DOTFILES_DIR"/src/emacs/.emacs "$HOME"/.emacs
        
        echo ". $DOTFILES_DIR/src/easypost/.zshrc-aws" >> "$HOME"/.zshrc
    elif [[ "$HOSTNAME" == "$SERVER_HOSTNAME" ]] ; then
        ln -sfn "$DOTFILES_DIR"/src/personal/home/.gitconfig "$HOME"/.gitconfig
        ln -sfn "$DOTFILES_DIR"/src/personal/home/.zlogin "$HOME"/.zlogin
        ln -sfn "$DOTFILES_DIR"/src/emacs/.emacs "$HOME"/.emacs
        
        crontab - < "$DOTFILES_DIR"/src/server/crontab
        
        echo ". $DOTFILES_DIR/src/personal/home/.zshrc" >> "$HOME"/.zshrc
    else
        echo "HOSTNAME doesn't match any config."
    fi
}

dots_config_down() {
    # `.zshrc` taken care of by Dots for all of these
    if [[ "$HOSTNAME" == "$PERSONAL_HOSTNAME" ]] ; then
        rm -i "$HOME"/.gitconfig
        rm -i "$HOME"/.zlogin
        rm -i "$HOME"/.emacs
    elif [[ "$HOSTNAME" == "$EASYPOST_HOSTNAME" ]] ; then
        rm -i "$HOME"/.gitconfig
        rm -i "$HOME"/.zlogin
	    rm -i -rf "$HOME"/.ssh/config
        rm "$HOME"/.emacs
    elif [[ "$HOSTNAME" == "$EASYPOST_AWS_HOSTNAME" ]] ; then
	    rm -i "$HOME"/.gitconfig
        rm "$HOME"/.emacs
    elif [[ "$HOSTNAME" == "$SERVER_HOSTNAME" ]] ; then
        rm -i "$HOME"/.gitconfig
        rm -i "$HOME"/.zlogin
        rm "$HOME"/.emacs
        
        crontab -r
    else
        echo "HOSTNAME doesn't match any config."
    fi
}
