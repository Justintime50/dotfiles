## Path ##
path=(
	/usr/local/opt/ruby/bin
	/Users/jhammond/.composer/vendor/bin
	/usr/local/sbin
	/usr/local/bin
	/usr/bin
	/bin
	/usr/sbin
	/sbin
	/opt/X11/bin
	/Users/jhammond/bin/gam
	/usr/local/opt/node@12/bin
	/Users/jhammond/bin/gam
	$(dirname $(go list -f '{{.Target}}' .))
)

## Prompt ##
# http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
PROMPT="%n@%C $ "

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
alias lsa="ls -la"

# Import dotfile functions
source "$HOME"/dotfiles/src/scripts/functions.sh
