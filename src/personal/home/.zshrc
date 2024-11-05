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
alias ssh-server2='ssh admin@192.168.7.3'
alias ssh-db1='ssh sysadmin@db1'
alias ssh-web1='ssh sysadmin@web1'
alias ssh-web2='ssh sysadmin@web2'

# Tools
alias emacs="emacs -nw"

## Internet/Networking
ECHO_IP_URL='ifconfig.co'
alias check-ip='curl ${ECHO_IP_URL}'
alias check-ipv4='curl -4 ${ECHO_IP_URL}'
alias check-ipv6='curl -6 ${ECHO_IP_URL}'
