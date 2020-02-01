# Path
PATH="/Users/jhammond/bin/gam:/usr/local/opt/ruby/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH

# Aliases
alias git-create="/Users/jhammond/git/git-create/git-create.sh"

# Functions
function push-dotfiles {
	cp "$HOME"/.zshrc "$HOME"/git/personal/dotfiles/src/easypost
	cp "$HOME"/.gitconfig "$HOME"/git/personal/dotfiles/src/easypost
    cp "$HOME"/.bash_profile "$HOME"/git/personal/dotfiles/src/easypost
	cd "$HOME"/git/personal/dotfiles
	git add .
	git commit -m "Updated dotfiles"
	git push
	echo "Dotfiles updated!" 
}
function pull-dotfiles {
	curl -s https://raw.githubusercontent.com/justintime50/dotfiles/master/src/easypost/install.sh | bash
}
