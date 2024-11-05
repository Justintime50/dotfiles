# General ZSH configuration (not machine specific)

###########
## Shell ##
PROMPT='%(?.%F{green}⏺.%F{red}⏺)%f %F{green}%m%f:%F{blue}%3~%f $ '
HOSTNAME=$(hostname)
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=1000

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

#############
## Aliases ##

# Custom
alias cg='cd $HOME/git'
alias cgp='cd $HOME/git/personal'
alias cge='cd $HOME/git/easypost'
alias cgsh='cd $HOME/git/shield-management'
alias cgfl='cd $HOME/git/fairway-logic'
alias lsa="ls -la"
alias vscode_settings='code $HOME/Library/Application\ Support/Code/User/settings.json'
alias dotfiles='code $HOME/.dotfiles'

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

alias kill-vscode-server="do_kill_vscode_server"
do_kill_vscode_server() {
    pgrep -f .vscode-server | xargs kill -9
}
