# shellcheck disable=SC1090,SC2148

HOSTNAME=$(hostname) # Required for macOS
DOTFILES_DIR="$HOME/.dotfiles"
DOTS_SCRIPT="$DOTFILES_DIR/dots/src/dots.sh"
DOTS_CONFIG_FILE="$DOTFILES_DIR/dots-config.sh"
DOTFILES_URL="$DOTFILES_URL"
DOTFILES_GITHUB_USER="$(basename "$(dirname $DOTFILES_URL)")" # Dynamically fill this based on the dotfiles URL

# TODO: Add a function that allows you to see what dotfiles were linked

# 1. git submodule add https://github.com/justintime50/dots
# 2. echo ". $HOME/.dotfiles/dots/src/dots.sh" >> "$HOME/.zshrc"
# 3. DOTFILES_URL="https://github.com/Justintime50/dotfiles.git" dots_sync

# Checks that dotfiles are up to date each time a terminal starts
dots_get_dotfiles_status() {
	if [[ -d "$DOTFILES_DIR" ]] ; then
		git -C "$DOTFILES_DIR" remote update > /dev/null 2>&1 || echo "Error updating from remote Dotfiles"
		git -C "$DOTFILES_DIR" status -s -b || echo "Couldn't check remote Dotfiles"
	else
		echo "Dotfiles directory does not exist."
	fi
}

# Ensures the shell being used is supported, warns if not
dots_check_shell() {
	if [[ "$SHELL" != "/bin/zsh" && "$SHELL" != "/bin/bash" ]] ; then
		echo "Dots doesn't support $SHELL"
	fi
}

dots_init_message() {
	# Print dotfiles message on each shell start (will be initialized from core shell file)
	echo "#################### $SHELL ####################"
	dots_check_shell
	echo "Hostname: $HOSTNAME"
	echo "Powered by $DOTFILES_GITHUB_USER's Dotfiles"
	echo ""
	echo "Dotfiles status: "
	dots_get_dotfiles_status
	echo "##################################################"
}

# Push dotfiles up to the Git server
dots_push() {
	if [[ -d "$DOTFILES_DIR" ]] ; then
		git -C "$DOTFILES_DIR" add .
		git -C "$DOTFILES_DIR" commit -m "Updated dotfiles"
		git -C "$DOTFILES_DIR" push > /dev/null 2>&1 && echo "Dotfiles pushed!" || echo "Error pushing Dotfiles"
	else
		echo "Dotfiles directory does not exist."
	fi
}

# Pull the dotfiles project if it exists, clone if it does not
dots_pull() {	
    echo "Installing dotfiles..."
    if [[ ! -d "$DOTFILES_DIR" ]] ; then
		echo "Dots will clone your Dotfiles. Be aware that this will override current Dotfiles. Press any key to continue."
		read -rn 1
        git clone "$DOTFILES_URL" "$DOTFILES_DIR" > /dev/null 2>&1 && echo "Dotfiles cloned!" || echo "Error cloning Dotfiles"
    else
		echo "Dots will pull updated Dotfiles. Be aware that this will override current Dotfiles. Press any key to continue."
		read -rn 1
        git -C "$DOTFILES_DIR" pull > /dev/null 2>&1 && echo "Dotfiles pulled!" || echo "Error pulling Dotfiles"
    fi
}

# Resets the .zshrc/.bash_profile files to only contain Dots and the config
dots_reset_terminal_config() {
	if [[ "$SHELL" == "/bin/zsh" ]] ; then
		rm "$HOME/.zshrc"
		echo "# Dots Config" >> "$HOME/.zshrc"
		echo "DOTFILES_URL=\"$DOTFILES_URL\"" >> "$HOME/.zshrc"
		echo ". $DOTS_SCRIPT" >> "$HOME/.zshrc"
		echo ". $DOTS_CONFIG_FILE" >> "$HOME/.zshrc"
		echo "dots_init_message" >> "$HOME/.zshrc"
		echo "# Dotfiles Config" >> "$HOME/.zshrc"
	elif [[ "$SHELL" == "/bin/bash" ]] ; then
		rm "$HOME/.bash_profile"
		echo "DOTFILES_URL=\"$DOTFILES_URL\"" >> "$HOME/.bash_profile"
		echo "# Dots Config" >> "$HOME/.bash_profile"
		echo ". $DOTS_SCRIPT" >> "$HOME/.bash_profile"
		echo ". $DOTS_CONFIG_FILE" >> "$HOME/.bash_profile"
		echo "dots_init_message" >> "$HOME/.bash_profile"
		echo "# Dotfiles Config" >> "$HOME/.bash_profile"
	fi
}

# Installs the newly pulled dotfiles
dots_install() {
	if [[ -f "$DOTS_CONFIG_FILE" ]] ; then
		dots_reset_terminal_config

		# This command is sourced from "$DOTS_CONFIG_FILE":
		dots_config_up && echo "Dotfiles installed!" || echo "Error installing Dotfiles"
	else
		echo "Dots couldn't find $DOTS_CONFIG_FILE."
	fi
}

# Cleans dotfiles
dots_clean() {
	if [[ -f "$DOTS_CONFIG_FILE" ]] ; then
		dots_reset_terminal_config

		# This command is sourced from "$DOTS_CONFIG_FILE":
		dots_config_down && echo "Dotfiles cleaned!" || echo "Error cleaning Dotfiles"
	else
		echo "Dots couldn't find $DOTS_CONFIG_FILE."
	fi
}

dots_sync() {
	# TODO: Do we want to push as a first step?
	# 1. pull new dotfiles
	# 2. install the dotfiles based on user config
	# 3. bounce (source) the new dotfiles
	dots_pull
	dots_install
	dots_bounce
}

# Restart the shell after Dotfile installation
dots_bounce() {
	exec "$SHELL"
}
