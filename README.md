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
git clone git@github.com:Justintime50/dotfiles.git "$HOME/.dotfiles"

# 2) Source Dots and Shell
cd "$HOME/.dotfiles" && git submodule init && git submodule update
echo ". $HOME/.dotfiles/dots/src/dots.sh" >> "$HOME/.zshrc" && . "$HOME/.zshrc"

# 3) Run Dots initially specifying the Dotfiles URL
DOTFILES_URL="git@github.com:Justintime50/dotfiles.git" dots_sync
```

### Windows

Not much here except the `.gitconfig` file:

```batch
curl -LJs https://raw.githubusercontent.com/justintime50/dotfiles/main/src/personal/home/.gitconfig -o %HOMEPATH%
```

### Additional Setup

* **Emacs**
    1. Run `M-x package-install use-package` which will bootstrap the remaining packages on first start
    1. You may need to comment out the line that loads the theme until the entire init script is run (which installs the theme) at which point you can uncomment the theme load line
* **iTerm2**
    1. Load iTerm2 preferences by pointing iTerm2 to the `plist` found in the `personal/iterm2` directory.
    2. Open the GitHub Dark theme file in `personal/iterm2/github-vscode-theme-iterm` and select it as the current theme
* **Vim**
    1. As long as submodules are initialized and updated locally, Vim should set itself up with `Packer`

## Usage

See the [Dots project](https://github.com/Justintime50/dots) for instructions on managing these Dotfiles.
