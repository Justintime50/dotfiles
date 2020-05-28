# shellcheck disable=SC1090,SC2148
## Dotfile Functions ##
function push-dotfiles {
	cp "$HOME"/.zshrc "$HOME"/dotfiles/src
	cp "$HOME"/.gitconfig "$HOME"/dotfiles/src
	# cp /etc/hosts "$HOME"/dotfiles/src
	cd "$HOME"/dotfiles || exit
	git add .
	git commit -m "Updated dotfiles"
	git push
	echo "Dotfiles pushed!"
	cd || exit
}
function pull-dotfiles {
	curl -s https://raw.githubusercontent.com/justintime50/dotfiles/master/src/scripts/install.sh | bash
}

# Check that dotfiles are up to date each time a terminal starts
echo "Dotfiles status: " && cd "$HOME"/dotfiles || exit && git status -uno && cd || exit
