#########################
## Personal ZSH Config ##

##########
## Path ##
export path=(
    /opt/homebrew/bin
    /opt/homebrew/sbin
    /opt/homebrew/opt/ruby/bin
    /opt/homebrew/lib/ruby/gems/3.1.0/bin
    /usr/local/opt/ruby/bin
    /usr/local/lib/ruby/gems/3.1.0/bin
    /usr/local/bin
    /usr/bin
    /bin
    /usr/local/sbin
    /usr/sbin
    /sbin
    /opt/X11/bin
    /Users/"$USER"/bin/gam
    /Users/"$USER"/.dotnet/tools
    /usr/local/Cellar/mono/6.12.0.122_1/bin
    /Users/"$USER"/.cargo/bin
    /Users/"$USER"/.local/bin
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
