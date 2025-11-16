#########################
## Personal ZSH Config ##

##########
## Path ##
export path=(
	# User-specific binaries
	/Users/"$USER"/.cargo/bin
	/Users/"$USER"/.local/bin
	# Pyenv binaries (must come before homebrew to avoid conflicts)
	/Users/"$USER"/.pyenv/bin
	# Homebrew binaries
	/opt/homebrew/opt/ruby/bin
	/opt/homebrew/bin
	/opt/homebrew/sbin
	# System binaries
	/usr/local/bin
	/usr/bin
	/bin
	/usr/local/sbin
	/usr/sbin
	/sbin
)

# Pyenv
eval "$(pyenv init - zsh)"

#############
## Aliases ##

# SSH
alias ssh-lb1='ssh -A sysadmin@lb1'
alias ssh-web1='ssh -A sysadmin@web1'
alias ssh-web2='ssh -A sysadmin@web2'
alias ssh-db1='ssh -A sysadmin@db1'
alias ssh-db2='ssh -A sysadmin@db2'
alias ssh-dev1='ssh -A sysadmin@dev1'

# Tools
alias emacs="emacs -nw"

## Internet/Networking
ECHO_IP_URL='ifconfig.co'
alias check-ip='curl ${ECHO_IP_URL}'
alias check-ipv4='curl -4 ${ECHO_IP_URL}'
alias check-ipv6='curl -6 ${ECHO_IP_URL}'
