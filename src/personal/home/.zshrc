#########################
## Personal ZSH Config ##

##########
## Path ##
path=(
	/usr/local/opt/ruby/bin
	/usr/local/lib/ruby/gems/2.7.0/bin
	/Users/jhammond/.composer/vendor/bin
	/usr/local/bin
	/usr/bin
	/bin
	/usr/local/sbin
	/usr/sbin
	/sbin
	/opt/X11/bin
	/Users/jhammond/bin/gam
	$(go env GOPATH)/bin
)

############
## Prompt ##
# http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
PROMPT="%n@%C $ "
HOSTNAME=$(hostname)

#############
## Aliases ##

# Tools
alias composer="php /usr/local/bin/composer"
alias emacs="emacs -nw"

# Custom
alias cg="cd ~/git"
alias cgp="cd ~/git/personal"
alias cge="cd ~/git/easypost"
alias lsa="ls -la"
