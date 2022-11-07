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
)

############
## Prompt ##
# http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
export PROMPT="%n@%C $ "
HOSTNAME=$(hostname)

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

###############
## Variables ##
# srvinfra
export SRVINFRA_WEBSITES_DIR="$HOME/harvey/projects"
export SRVINFRA_SERVICES_DIR="$HOME/harvey/projects/justintime50/server-infra/src"

# Java
# See the following for Java releasing variables: https://issues.sonatype.org/browse/NEXUS-27902 & https://github.com/keybase/keybase-issues/issues/2798
export JDK_JAVA_OPTIONS='--add-opens java.base/java.util=ALL-UNNAMED --add-opens java.base/java.lang.reflect=ALL-UNNAMED --add-opens java.base/java.text=ALL-UNNAMED --add-opens java.desktop/java.awt.font=ALL-UNNAMED'
GPG_TTY="$(tty)"
export GPG_TTY
JAVA_HOME=$(/usr/libexec/java_home)
export JAVA_HOME

#############
## Aliases ##

# Tools
alias emacs="emacs -nw"

## Internet/Networking
ECHO_IP_URL='ifconfig.co'
alias check-ip='curl ${ECHO_IP_URL}'
alias check-ipv4='curl -4 ${ECHO_IP_URL}'
alias check-ipv6='curl -6 ${ECHO_IP_URL}'

# Custom
alias cg='cd $HOME/git'
alias cgp='cd $HOME/git/personal'
alias cge='cd $HOME/git/easypost'
alias lsa="ls -la"
alias vscode_settings='emacs $HOME/Library/Application\ Support/Code/User/settings.json'

###############
## Functions ##

# Recursively prints each git branch of each repo in a specified directory (first argument)
alias check-git-branches=do_check_git_branches
do_check_git_branches() {
    cd "$1" || echo "Could not 'cd' into directory"
    for DIR in */; do
        printf '%s\n' "$DIR"
        if cd "$DIR"; then
            git branch
        else
            echo "Could not 'cd' into directory"
        fi
        cd .. || echo "Could not 'cd' out of directory"
    done
}

alias kill-port=do_kill_port
do_kill_port() {
    # shellcheck disable=SC2207
    pids_array=($(lsof -t -i:"$1" | sed -e ':a' -e 'N' -e '$!ba' -e 's/\n/ /g'))
    # shellcheck disable=SC2128
    if [ "$pids_array" ]; then
        for pid in "${pids_array[@]}"; do
            echo "Killing process $pid..."
            kill "$pid"
        done
    else
        echo "No process running on port $1"
    fi
}
