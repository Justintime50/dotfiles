#########################
## EasyPost ZSH Config ##

###########
## Setup ##

EP_USERNAME="jhammond"
ADMIN_HOST="admin.easypo.net"
AWS_DEVVM_EL8_INSTANCE_NAME="oregon2"
AWS_DEVVM_USER="vagrant"
AWS_DEVVM_HOST="devvm.easypo.net"
AWS_DEVVM_BASTION_HOST="admin.dev.easypo.net"
AWS_UPLOADS_DIR="/home/$AWS_DEVVM_USER/uploads"

#############
## Aliases ##

# SSH
alias ssh-oregon2='ssh -A $AWS_DEVVM_USER@$AWS_DEVVM_EL8_INSTANCE_NAME.$EP_USERNAME.$AWS_DEVVM_HOST'
alias ssh-oregon2-jump='ssh -A -J `whoami`@$AWS_DEVVM_BASTION_HOST $AWS_DEVVM_USER@$AWS_DEVVM_EL8_INSTANCE_NAME.`whoami`.devvm.easypo.net'
alias ssh-admin='ssh -A $ADMIN_HOST'

###############
## Functions ##

alias scp-upload-oregon2="do_scp_upload_oregon2"
do_scp_upload_oregon2() {
    if [ -z "$1" ]; then
        echo "You must provide a filename to use SCP."
    else
        scp "$@" "$AWS_DEVVM_USER"@"$AWS_DEVVM_EL8_INSTANCE_NAME"."$EP_USERNAME"."$AWS_DEVVM_HOST":"$AWS_UPLOADS_DIR" || echo "Couldn't copy file."
    fi
}

alias scp-download-oregon2="do_scp_download_oregon2"
do_scp_download_oregon2() {
    if [ -z "$1" ]; then
        echo "You must provide a filename to use SCP."
    else
        scp "$AWS_DEVVM_USER"@"$AWS_DEVVM_EL8_INSTANCE_NAME"."$EP_USERNAME"."$AWS_DEVVM_HOST":"$1" "$HOME"/Downloads/ || echo "Couldn't copy file."
    fi
}
