#########################
## EasyPost ZSH Config ##

###########
## Setup ##

EP_USERNAME="jhammond"
ADMIN_HOST="admin.easypo.net"
ADHOC_HOST="adhoc2nuq"
SHARED_DEV_HOST="admin.dev.easypo.net"
AWS_DEVVM_OREGON3_INSTANCE_NAME="oregon3"
AWS_DEVVM_USER="vagrant"
AWS_DEVVM_HOST="devvm.easypo.net"
AWS_DEVVM_BASTION_HOST="admin.dev.easypo.net"
AWS_UPLOADS_DIR="/home/$AWS_DEVVM_USER/uploads"

##########
## Path ##
export path=(
	# User-specific binaries
	/Users/"$USER"/.cargo/bin
	/Users/"$USER"/.local/bin
	/Users/"$USER"/.dotnet/tools
	# Pyenv binaries (must come before homebrew to avoid conflicts)
	/Users/"$USER"/.pyenv/bin
	# Homebrew binaries
	/opt/homebrew/opt/ruby/bin
	/opt/homebrew/bin
	/opt/homebrew/sbin
	# Mono binaries
	/usr/local/Cellar/mono/6.12.0.122_1/bin
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

# Java
GPG_TTY="$(tty)"
export GPG_TTY
# Override to use Zulu JDK 21
JAVA_HOME=$(/usr/libexec/java_home -v 21)
export JAVA_HOME

#############
## Aliases ##

# SSH
alias ssh-oregon3='ssh -A $AWS_DEVVM_USER@$AWS_DEVVM_OREGON3_INSTANCE_NAME.$EP_USERNAME.$AWS_DEVVM_HOST'
alias ssh-oregon3-jump='ssh -A -J `whoami`@$AWS_DEVVM_BASTION_HOST $AWS_DEVVM_USER@$AWS_DEVVM_OREGON3_INSTANCE_NAME.`whoami`.devvm.easypo.net'
alias ssh-admin='ssh -A $ADMIN_HOST'
alias ssh-shared-dev='ssh -A $SHARED_DEV_HOST'
alias ssh-adhoc='ssh -A $ADHOC_HOST'

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
