<div align="center">

# Dotfiles

My personal dotfiles. Automated push/pull changes and sync warning.

[![Build Status](https://github.com/Justintime50/dotfiles/workflows/build/badge.svg)](https://github.com/Justintime50/dotfiles/actions)
[![Licence](https://img.shields.io/github/license/justintime50/dotfiles)](LICENSE)

<img src="assets/showcase.png" alt="Showcase">

</div>

Dotfiles are the configuration files that make your OS and tools do their magic. They are typically hidden, found in your home folder, and start with a `.` - thus they are called `Dotfiles`.

This project makes keeping dotfiles synced between machines a breeze. All dotfiles live in `~/dotfiles` and are symlinked to their respective locations. Each time a terminal is started, Dotfiles will print the shell being used, what dotfile modules are installed, and check to make sure that the local dotfiles match the remote copy and warn you if the copies have diverged. You can then run a single command to push or pull dotfile changes as needed to sync them between all your machines.

## Install

```bash
bash <(curl -s https://raw.githubusercontent.com/justintime50/dotfiles/master/src/scripts/install.sh)
```

**Personal Installation**

My personal dotfiles require keychain to setup your SSH keys correctly.

1. You can install [keychain](https://github.com/funtoo/keychain) with: `brew install keychain`.

**Emacs Installation**

Emacs requires a bit more setup, install the following plugins after opening Emacs:

1. You can install [monokai](https://github.com/oneKelvinSmith/monokai-emacs) with: `M-x package-install monokai-theme`.
1. Install [iSort](https://github.com/paetzke/py-isort.el) with: `M-x package-install py-isort`.

## Usage

Once installed, you can push, pull, or clean dotfiles with these easy commands. *Be aware that pushing or pulling will overwrite the current dotfiles!*

```bash
# Push dotfiles to GitHub
push-dotfiles

# Pull dotfiles from GitHub
pull-dotfiles

# Clean dotfiles from your local machine (you'll be prompted for each item)
clean-dotfiles
```
