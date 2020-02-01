# Path
PATH="/Users/jhammond/bin/gam:/usr/local/opt/ruby/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH

# Aliases
alias git-create="/Users/jhammond/git/git-create/git-create.sh"

# Functions
update-dotfiles() {
	cp $HOME/.zshrc $HOME/git/personal/dotfiles/src/easypost
	&& cp $HOME/.gitconfig $HOME/git/personal/dotfiles/src/easypost
    && cp $HOME/.bash_profile $HOME/git/personal/dotfiles/src/easypost
	&& git add . && git commit -m "Updated dotfiles" && git push && echo "Dotfiles updated"
}
