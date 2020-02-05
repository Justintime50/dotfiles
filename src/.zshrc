## Path ##
PATH="/usr/local/opt/ruby/bin:/Users/jhammond/.composer/vendor/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Users/jhammond/bin/gam:/usr/local/opt/node@12/bin:/Users/jhammond/bin/gam"
export PATH

## Prompt ##
#export PS1="\h:\W \u\$ "

## Aliases ##
# Tools
alias composer="php /usr/local/bin/composer"
# Projects
alias git-create="~/git/personal/git-create/git-create.sh"
alias burn-me="~/git/personal/burn-notice/burn-me.sh"
alias github-archive="~/git/personal/github-archive/github-archive.sh"
alias brew-update="~/git/personal/brew-update/brew-update.sh"
# Custom
alias cgp="cd ~/git/personal"
alias cge="cd ~/git/easypost"
alias la="ls -la"

## Functions ##
function push-dotfiles {
	cp "$HOME"/.zshrc "$HOME"/git/personal/dotfiles/src
	cp "$HOME"/.gitconfig "$HOME"/git/personal/dotfiles/src
	cp /etc/hosts "$HOME"/git/personal/dotfiles/src
	cd "$HOME"/git/personal/dotfiles
	git add .
	git commit -m "Updated dotfiles"
	git push
	echo "Dotfiles pushed!" 
}
function pull-dotfiles {
	curl -s https://raw.githubusercontent.com/justintime50/dotfiles/master/src/install.sh | bash
}
