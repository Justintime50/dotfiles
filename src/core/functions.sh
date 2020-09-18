# shellcheck disable=SC1090,SC2148

USER=Justintime50

# Print dotfiles message on shell start
echo "#################### $SHELL ####################"
echo "Powered by $USER's Dotfiles"
echo "Loaded modules:"
cat "$HOME"/dotfiles/src/core/loaded-modules.txt
# check that dotfiles are up to date each time a terminal starts
echo ""
echo "Dotfiles status: "
git -C "$HOME"/dotfiles remote update > /dev/null || { echo "Error updating from remote Dotfiles"; exit 1; }
git -C "$HOME"/dotfiles status -s -b || { echo "Couldn't check remote Dotfiles"; exit 1; }
echo "##################################################"

## Dotfile Functions ##
function push-dotfiles {
	git -C "$HOME"/dotfiles add .
	git -C "$HOME"/dotfiles commit -m "Updated dotfiles"
	git -C "$HOME"/dotfiles push > /dev/null || { echo "Error pushing Dotfiles"; exit 1; }
	echo "Dotfiles pushed!"
}
function pull-dotfiles {
	bash <(curl -s https://raw.githubusercontent.com/justintime50/dotfiles/master/src/scripts/install.sh)
}
