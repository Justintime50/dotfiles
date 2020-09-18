<div align="center">

# Dotfiles

My personal dotfiles. Automated push/pull changes and sync warning.

[![Build Status](https://travis-ci.com/Justintime50/dotfiles.svg?branch=master)](https://travis-ci.com/Justintime50/dotfiles)
[![Licence](https://img.shields.io/github/license/justintime50/dotfiles)](LICENSE)

<img src="assets/showcase.png" alt="Showcase">

</div>

Dotfiles are the configuration files that make your OS and tools do their magic. They are typically hidden, found in your home folder, and start with a `.` - thus they are called `Dotfiles`.

This project makes keeping dotfiles synced between machines a breeze. All dotfiles live in `~/dotfiles` and are symlinked to their respective locations. Each time a terminal is started, Dotfiles will print the shell being used, what dotfile modules are installed, and check to make sure that the local dotfiles match the remote copy and warn you if the copies have diverged. You can then run a single command to push or pull dotfile changes as needed to sync them between all your machines.

## Usage

### Install Dotfiles

```bash
bash <(curl -s https://raw.githubusercontent.com/justintime50/dotfiles/master/src/scripts/install.sh)
```

### Push/Pull Dotfiles

Once installed, you can push/pull any changes with these easy commands. *Be aware that pushing/pulling will overwrite the current dotfiles!*

```bash
# Push dotfiles to GitHub
push-dotfiles

# Pull dotfiles from GitHub
pull-dotfiles
```
