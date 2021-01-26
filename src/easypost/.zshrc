#########################
## EasyPost ZSH Config ##

###########
## Setup ##

EP_USERNAME="jhammond"
ADMIN_HOST="admin.easypo.net"
AWS_DEVVM="oregon1"
AWS_DEVVM_USER="vagrant"
AWS_DEVVM_HOST="devvm.easypo.net"
AWS_DEVVM_BASTION_HOST="admin.dev.easypo.net"
AWS_UPLOADS_DIR="/home/$AWS_DEVVM_USER/uploads"

#############
## Aliases ##

# SSH
alias ssh-devvm='ssh -A $AWS_DEVVM_USER@$AWS_DEVVM.$EP_USERNAME.$AWS_DEVVM_HOST'
alias ssh-devvm-jump='ssh -A -J `whoami`@$AWS_DEVVM_BASTION_HOST $AWS_DEVVM_USER@$AWS_DEVVM.`whoami`.devvm.easypo.net'
alias ssh-teamvm='ssh -A $AWS_DEVVM_USER@team.jontsai.$AWS_DEVVM_HOST'
alias ssh-admin='ssh -A admin.easypo.net'

# Proxies
alias eztunnel='ssh -L 1080:proxy.local.easypo.net:1080 -N -C ${EP_USERNAME}@${ADMIN_HOST}'

# SCP/RSync
alias scp-upload="do-scp-upload"
function do-scp-upload {
    if [ -z "$1" ] ; then
        echo "You must provide a filename to use SCP."
    else
        scp "$@" "$AWS_DEVVM_USER"@"$AWS_DEVVM"."$EP_USERNAME"."$AWS_DEVVM_HOST":"$AWS_UPLOADS_DIR" || echo "Couldn't copy file."
    fi
}

alias scp-download="do-scp-download"
function do-scp-download {
    if [ -z "$1" ] ; then
        echo "You must provide a filename to use SCP."
    else
        scp "$AWS_DEVVM_USER"@"$AWS_DEVVM"."$EP_USERNAME"."$AWS_DEVVM_HOST":"$1" "$HOME"/Downloads/ || echo "Couldn't copy file."
    fi
}
