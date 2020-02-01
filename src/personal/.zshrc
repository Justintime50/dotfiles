# Path
PATH="/Users/jhammond/.composer/vendor/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:usr/local/opt/ruby/bin:/usr/local/opt/ruby/bin:/Users/jhammond/bin/gam:/usr/local/opt/node@12/bin"
export PATH

# Aliases
alias composer="php /usr/local/bin/composer"
alias git-create="~/git/personal/git-create/git-create.sh"

# Functions
function push-dotfiles {
	cp "$HOME"/.zshrc "$HOME"/git/personal/dotfiles/src/personal
	cp "$HOME"/.gitconfig "$HOME"/git/personal/dotfiles/src/personal
	cd "$HOME"/git/personal/dotfiles
	git add .
	git commit -m "Updated dotfiles"
	git push
	echo "Dotfiles pushed!" 
}
function pull-dotfiles {
	curl -s https://raw.githubusercontent.com/justintime50/dotfiles/master/src/personal/install.sh | bash
}
