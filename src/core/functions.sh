# shellcheck disable=SC1090,SC2148

DOTFILES_DIR="$HOME/dotfiles"
GITHUB_USER=Justintime50

function print_dotfiles_message {
	# Print dotfiles message on each shell start
	echo "#################### $SHELL ####################"
	echo "Powered by $GITHUB_USER's Dotfiles"
	echo "Loaded modules:"
	cat "$DOTFILES_DIR"/src/core/loaded-modules.txt
	# check that dotfiles are up to date each time a terminal starts
	echo ""
	echo "Dotfiles status: "
	git -C "$DOTFILES_DIR" remote update > /dev/null 2>&1 || { echo "Error updating from remote Dotfiles"; exit 1; }
	git -C "$DOTFILES_DIR" status -s -b || { echo "Couldn't check remote Dotfiles"; exit 1; }
	echo "##################################################"
}
print_dotfiles_message

## Dotfile Functions ##
function push-dotfiles {
	git -C "$DOTFILES_DIR" add .
	git -C "$DOTFILES_DIR" commit -m "Updated dotfiles"
	git -C "$DOTFILES_DIR" push > /dev/null 2>&1 || { echo "Error pushing Dotfiles"; exit 1; }
	echo "Dotfiles pushed!"
}
function pull-dotfiles {
	bash <(curl -s https://raw.githubusercontent.com/justintime50/dotfiles/master/src/scripts/install.sh)
}
function clean-dotfiles {
	# Remove symlinks and restore original core .zshrc config
	ln -sfn "$DOTFILES_DIR"/src/core/.zshrc "$HOME"/.zshrc
	rm -i "$HOME"/.gitconfig
	# rm -i /etc/hosts
	rm -i "$HOME"/.gitconfig-easypost
    rm -i "$HOME"/.ssh/config
	rm -i "$HOME"/.emacs
	echo "Dotfiles cleaned!"
}
