# shellcheck disable=SC1090,SC2148

DOTFILES_DIR="$HOME/.dotfiles"
GITHUB_USER=Justintime50

print_dotfiles_message() {
	# Print dotfiles message on each shell start
	echo "#################### $SHELL ####################"
	echo "Powered by $GITHUB_USER's Dotfiles"
	echo "Loaded modules:"
	cat "$DOTFILES_DIR"/src/core/loaded-modules.txt
	echo ""
	echo "Dotfiles status: "
	# check that dotfiles are up to date each time a terminal starts
	git -C "$DOTFILES_DIR" remote update > /dev/null 2>&1 || { echo "Error updating from remote Dotfiles"; exit 1; }
	git -C "$DOTFILES_DIR" status -s -b || { echo "Couldn't check remote Dotfiles"; exit 1; }
	echo "##################################################"
}

## Dotfile Functions ##
push-dotfiles() {
	git -C "$DOTFILES_DIR" add .
	git -C "$DOTFILES_DIR" commit -m "Updated dotfiles"
	git -C "$DOTFILES_DIR" push > /dev/null 2>&1 || { echo "Error pushing Dotfiles"; exit 1; }
	echo "Dotfiles pushed!"
}

pull-dotfiles() {
	bash <(curl -s https://raw.githubusercontent.com/justintime50/dotfiles/master/src/scripts/install.sh)
}

clean-dotfiles() {
	# Remove symlinks and restore original core .zshrc config
	
	# Core
	cp "$DOTFILES_DIR"/src/core/.zshrc "$HOME"/.zshrc
	
	# Personal
	rm -i "$HOME"/.gitconfig
	rm -i "$HOME"/.zlogin
	
	# EasyPost
	rm -i -rf "$HOME"/.ssh/config

	# EasyPost AWS
	rm -i "$HOME"/.gitconfig
	
	# Emacs
	rm -i "$HOME"/.emacs

	# Server
	crontab - < "# Empty cron"

	echo "Dotfiles cleaned!"
}

print_dotfiles_message
