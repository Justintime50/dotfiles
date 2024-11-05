#########################
## Personal ZSH Config ##

##########
## Path ##
export path=(
    # User-specific binaries
    /Users/"$USER"/.cargo/bin
    /Users/"$USER"/.local/bin
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

###############
## Variables ##
# srvinfra
export SRVINFRA_SERVICES_DIR="$HOME/harvey/projects"

#############
## Aliases ##

# SSH
# TODO: Unify the naming here and update machines
alias ssh-md-db-1='ssh sysadmin@192.168.7.2'
alias ssh-server2='ssh admin@192.168.7.3'
alias ssh-small-web-1='ssh sysadmin@192.168.7.5'
alias ssh-small-web-2='ssh sysadmin@192.168.7.6'

# Tools
alias emacs="emacs -nw"

## Internet/Networking
ECHO_IP_URL='ifconfig.co'
alias check-ip='curl ${ECHO_IP_URL}'
alias check-ipv4='curl -4 ${ECHO_IP_URL}'
alias check-ipv6='curl -6 ${ECHO_IP_URL}'
