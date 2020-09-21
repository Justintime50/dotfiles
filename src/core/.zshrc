#############
## Imports ##

# Import core PATH (will be overridden by other dotfiles paths if installed)
PATH=$HOME/bin:$PATH:/usr/local/sbin:/usr/local/bin
export PATH

# Import dotfiles core
DOTFILES_DIR="$HOME/dotfiles"
source "$DOTFILES_DIR"/src/core/functions.sh

# Import dotfiles below (Dotfiles intallation will automatically add imports here)
# source /path/to/dotfiles/file
