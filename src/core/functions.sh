# shellcheck disable=SC1090,SC2148
## Dotfile Functions ##
function push-dotfiles {
	git -C "$HOME"/dotfiles add .
	git -C "$HOME"/dotfiles commit -m "Updated dotfiles"
	git -C "$HOME"/dotfiles push
	echo "Dotfiles pushed!"
}
function pull-dotfiles {
	bash <(curl -s https://raw.githubusercontent.com/justintime50/dotfiles/master/src/scripts/install.sh)
}

# Check that dotfiles are up to date each time a terminal starts
echo "Dotfiles status: "
git -C "$HOME"/dotfiles remote update || echo "Couldn't check remote Dotfiles"
git -C "$HOME"/dotfiles status -s || echo "Couldn't check remote Dotfiles"
