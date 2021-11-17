<div align="center">

# Dotfiles

My personal Dotfiles managed via [Dots](https://github.com/Justintime50/dots).

[![Build Status](https://github.com/Justintime50/dotfiles/workflows/build/badge.svg)](https://github.com/Justintime50/dotfiles/actions)
[![Licence](https://img.shields.io/github/license/justintime50/dotfiles)](LICENSE)

<img src="https://raw.githubusercontent.com/justintime50/assets/main/src/dotfiles/showcase.png" alt="Showcase">

</div>

Dotfiles are the configuration files that make your OS and tools do their magic. They are typically hidden, found in your home folder, and start with a `.` - thus they are called `Dotfiles`.

## Install

### macOS and Linux

```bash
# 1) Clone the project
git clone https://github.com/Justintime50/dotfiles.git "$HOME/.dotfiles"

# 2) Source Dots and Shell
cd "$HOME/.dotfiles" && git submodule init && git submodule update
echo ". $HOME/.dotfiles/dots/src/dots.sh" >> "$HOME/.zshrc" && . "$HOME/.zshrc"

# 3) Run Dots initially specifying the Dotfiles URL
DOTFILES_URL="https://github.com/Justintime50/dotfiles.git" dots_sync
```

### Windows

Not much here except the `.gitconfig` file:

```batch
curl -LJs https://raw.githubusercontent.com/justintime50/dotfiles/main/src/personal/home/.gitconfig -o %HOMEPATH%
```

### Additional Setup

* **iTerm2**
    1. Load iTerm2 preferences by pointing iTerm2 to the `plist` found in the `personal/iterm2` directory.
* **Emacs**
    1. Install the [GitHub Dark Visual Studio Code Emacs Theme](https://github.com/Justintime50/github-dark-vscode-emacs-theme) following the guide in its README.
    1. Run the following to install all Emacs packages: `M-x package-refresh-contents` then `M-x package-install-selected-packages`

## Usage

See the [Dots project](https://github.com/Justintime50/dots) for instructions on managing these Dotfiles.
