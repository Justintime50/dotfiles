#########################
## Personal ZSH Config ##

USERNAME=jhammond

##########
## Path ##
export path=(
	/usr/local/opt/ruby/bin
	/usr/local/lib/ruby/gems/3.0.0/bin
	/Users/"$USERNAME"/.composer/vendor/bin
	/usr/local/bin
	/usr/bin
	/bin
	/usr/local/sbin
	/usr/sbin
	/sbin
	/opt/X11/bin
	/Users/"$USERNAME"/bin/gam
	"$(go env GOPATH)"/bin
	/Users/"$USERNAME"/.dotnet/tools
)

############
## Prompt ##
# http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
export PROMPT="%n@%C $ "
HOSTNAME=$(hostname)

#############
## Aliases ##

# Tools
alias composer="php /usr/local/bin/composer"
alias emacs="emacs -nw"

## Internet/Networking
ECHO_IP_URL='ifconfig.co'
alias check-ip='curl ${ECHO_IP_URL}'
alias check-ipv4='curl -4 ${ECHO_IP_URL}'
alias check-ipv6='curl -6 ${ECHO_IP_URL}'

# Custom
alias cg="cd ~/git"
alias cgp="cd ~/git/personal"
alias cge="cd ~/git/easypost"
alias lsa="ls -la"

###############
## Functions ##

# Recursively prints each git branch of each repo in a specified directory (first argument)
alias check-git-branches=do_check_git_branches
do_check_git_branches() {
    cd "$1" || echo "Could not 'cd' into directory"
    for DIR in */ ; do
        printf '%s\n' "$DIR"
        if cd "$DIR"; then
			git branch 
		else
			echo "Could not 'cd' into directory"
		fi
        cd .. || echo "Could not 'cd' out of directory"
    done
}
