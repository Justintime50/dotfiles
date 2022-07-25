# Up/Down Dotfile "Migrations" via Dots

PERSONAL_HOSTNAME="MacBook-Pro-Justin"
EASYPOST_HOSTNAME="MacBook-Pro-Justin-EasyPost"
EASYPOST_AWS_HOSTNAME="oregon1"
SERVER_HOSTNAME="Server"
SERVER2_HOSTNAME="Server2"

dots_config_up() {
    if [[ "$HOSTNAME" == "$PERSONAL_HOSTNAME" ]]; then
        ln -sfn "$DOTFILES_DIR"/src/personal/home/.gitconfig "$HOME"/.gitconfig
        ln -sfn "$DOTFILES_DIR"/src/personal/home/.zlogin "$HOME"/.zlogin
	ln -sfn "$DOTFILES_DIR"/src/emacs/.emacs "$HOME"/.emacs
        ln -sfn "$DOTFILES_DIR"/src/vim/.vimrc "$HOME"/.vimrc
	ln -sfn "$DOTFILES_DIR"/src/vim/.vimrc "$HOME"/.config/nvim/init.vim
        crontab - <"$DOTFILES_DIR"/src/personal/crontab
        echo ". $DOTFILES_DIR/src/personal/home/.zshrc" >>"$HOME"/.zshrc
    elif [[ "$HOSTNAME" == "$EASYPOST_HOSTNAME" ]]; then
        ln -sfn "$DOTFILES_DIR"/src/personal/home/.gitconfig "$HOME"/.gitconfig
        ln -sfn "$DOTFILES_DIR"/src/personal/home/.zlogin "$HOME"/.zlogin
        ln -sfn "$DOTFILES_DIR"/src/easypost/ssh/config "$HOME"/.ssh/config
        ln -sfn "$DOTFILES_DIR"/src/emacs/.emacs "$HOME"/.emacs
        ln -sfn "$DOTFILES_DIR"/src/vim/.vimrc "$HOME"/.vimrc
	ln -sfn "$DOTFILES_DIR"/src/vim/.vimrc "$HOME"/.config/nvim/init.vim
        crontab - <"$DOTFILES_DIR"/src/easypost/crontab
        echo ". $DOTFILES_DIR/src/personal/home/.zshrc" >>"$HOME"/.zshrc
        echo ". $DOTFILES_DIR/src/easypost/.zshrc" >>"$HOME"/.zshrc
    elif [[ "$HOSTNAME" == "$EASYPOST_AWS_HOSTNAME" ]]; then
        ln -sfn "$DOTFILES_DIR"/src/easypost/.gitconfig-easypost-aws "$HOME"/.gitconfig
        ln -sfn "$DOTFILES_DIR"/src/emacs/.emacs "$HOME"/.emacs
        ln -sfn "$DOTFILES_DIR"/src/vim/.vimrc "$HOME"/.vimrc
	ln -sfn "$DOTFILES_DIR"/src/vim/.vimrc "$HOME"/.config/nvim/init.vim
        echo ". $DOTFILES_DIR/src/easypost/.zshrc-aws" >>"$HOME"/.zshrc
    elif [[ "$HOSTNAME" == *"$SERVER_HOSTNAME"* ]]; then
        ln -sfn "$DOTFILES_DIR"/src/personal/home/.gitconfig "$HOME"/.gitconfig
        ln -sfn "$DOTFILES_DIR"/src/personal/home/.zlogin "$HOME"/.zlogin
        ln -sfn "$DOTFILES_DIR"/src/emacs/.emacs "$HOME"/.emacs
        ln -sfn "$DOTFILES_DIR"/src/vim/.vimrc "$HOME"/.vimrc
	ln -sfn "$DOTFILES_DIR"/src/vim/.vimrc "$HOME"/.config/nvim/init.vim
        echo ". $DOTFILES_DIR/src/personal/home/.zshrc" >>"$HOME"/.zshrc
        if [[ "$HOSTNAME" == "$SERVER2_HOSTNAME" ]]; then
            crontab - <"$DOTFILES_DIR"/src/server/crontab
        fi
    else
        echo "HOSTNAME doesn't match any config."
    fi
}

dots_config_down() {
    # `.zshrc` taken care of by Dots for all of these
    if [[ "$HOSTNAME" == "$PERSONAL_HOSTNAME" ]]; then
        rm "$HOME"/.gitconfig
        rm "$HOME"/.zlogin
        rm "$HOME"/.emacs
	rm "$HOME"/.vimrc
	rm "$HOME"/.config/nvim/init.vim
        crontab -r
    elif [[ "$HOSTNAME" == "$EASYPOST_HOSTNAME" ]]; then
        rm "$HOME"/.gitconfig
        rm "$HOME"/.zlogin
        rm -rf "$HOME"/.ssh/config
        rm "$HOME"/.emacs
       	rm "$HOME"/.vimrc
	rm "$HOME"/.config/nvim/init.vim
	 crontab -r
    elif [[ "$HOSTNAME" == "$EASYPOST_AWS_HOSTNAME" ]]; then
        rm "$HOME"/.gitconfig
        rm "$HOME"/.emacs
 	rm "$HOME"/.vimrc
	rm "$HOME"/.config/nvim/init.vim
   elif [[ "$HOSTNAME" == *"$SERVER_HOSTNAME"* ]]; then
        rm "$HOME"/.gitconfig
        rm "$HOME"/.zlogin
        rm "$HOME"/.emacs
  	rm "$HOME"/.vimrc
	rm "$HOME"/.config/nvim/init.vim
        crontab -r
    else
        echo "HOSTNAME doesn't match any config."
    fi
}
