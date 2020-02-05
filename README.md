# Dotfiles

My personal dotfiles. Automated push/pull dotfile changes.

[![Build Status](https://travis-ci.org/Justintime50/dotfiles.svg?branch=master)](https://travis-ci.org/Justintime50/dotfiles)
[![MIT Licence](https://badges.frapsoft.com/os/mit/mit.svg?v=103)](https://opensource.org/licenses/mit-license.php)

Dotfiles are the configuration files that make your OS and tools do their magic. They are typically hidden, found in your home folder, and start with a `.` - thus they are called `Dotfiles`.

## Usage

### Install Dotfiles

```bash
# Install dotfiles
curl -s https://raw.githubusercontent.com/justintime50/dotfiles/master/src/install.sh | bash
```

### Push/Pull Dotfiles

Once installed, you can push/pull any changes with these easy commands. *Be aware that pushing/pulling will overwrite the current dotfiles.*

```bash
# Push dotfiles to GitHub
push-dotfiles

# Pull dotfiles from GitHub
pull-dotfiles
```

### Human Readable Path

Your path can get long, read it like a human:

```bash
tr ':' '\n' <<< "$PATH"
```
