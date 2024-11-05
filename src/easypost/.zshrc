#########################
## EasyPost ZSH Config ##

###########
## Setup ##

EP_USERNAME="jhammond"
ADMIN_HOST="admin.easypo.net"
SHARED_DEV_HOST="admin.dev.easypo.net"
AWS_DEVVM_OREGON3_INSTANCE_NAME="oregon3"
AWS_DEVVM_USER="vagrant"
AWS_DEVVM_HOST="devvm.easypo.net"
AWS_DEVVM_BASTION_HOST="admin.dev.easypo.net"
AWS_UPLOADS_DIR="/home/$AWS_DEVVM_USER/uploads"

#############
## Aliases ##

# SSH
alias ssh-oregon3='ssh -A $AWS_DEVVM_USER@$AWS_DEVVM_OREGON3_INSTANCE_NAME.$EP_USERNAME.$AWS_DEVVM_HOST'
alias ssh-oregon3-jump='ssh -A -J `whoami`@$AWS_DEVVM_BASTION_HOST $AWS_DEVVM_USER@$AWS_DEVVM_OREGON3_INSTANCE_NAME.`whoami`.devvm.easypo.net'
alias ssh-admin='ssh -A $ADMIN_HOST'
alias ssh-shared-dev='ssh -A $SHARED_DEV_HOST'

############
## Editor ##
unset EDITOR
if [[ -s $(which nvim) ]]; then
    export EDITOR=nvim
elif [[ -s $(which vim) ]]; then
    export EDITOR=vim
else
    export EDITOR=vi
fi
# Vim bindings on the CLI breaks my flow, don't use them there
bindkey -e

###########
## Shell ##
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=1000

###############
## Functions ##

alias scp-upload-oregon3="do_scp_upload_oregon3"
do_scp_upload_oregon3() {
    if [ -z "$1" ]; then
        echo "You must provide a filename to use SCP."
    else
        scp "$@" "$AWS_DEVVM_USER"@"$AWS_DEVVM_OREGON3_INSTANCE_NAME"."$EP_USERNAME"."$AWS_DEVVM_HOST":"$AWS_UPLOADS_DIR" || echo "Couldn't copy file."
    fi
}

alias scp-download-oregon3="do_scp_download_oregon3"
do_scp_download_oregon3() {
    if [ -z "$1" ]; then
        echo "You must provide a filename to use SCP."
    else
        scp "$AWS_DEVVM_USER"@"$AWS_DEVVM_OREGON3_INSTANCE_NAME"."$EP_USERNAME"."$AWS_DEVVM_HOST":"$1" "$HOME"/Downloads/ || echo "Couldn't copy file."
    fi
}
