#############
## Imports ##

# Import core PATH (will be overridden by other dotfiles paths if installed)
PATH=$HOME/bin:$PATH:/usr/local/sbin:/usr/local/bin
export PATH

# Import dotfiles core
source "$HOME"/dotfiles/src/core/functions.sh

# Import custom dotfiles not included in dotfiles installation (comment out as needed)
# source /path/to/dotfiles/file
