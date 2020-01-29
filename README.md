# Dotfiles

My personal dotfiles. Everyone else is doing it.

[![Build Status](https://travis-ci.org/Justintime50/dotfiles.svg?branch=master)](https://travis-ci.org/Justintime50/dotfiles)
[![MIT Licence](https://badges.frapsoft.com/os/mit/mit.svg?v=103)](https://opensource.org/licenses/mit-license.php)

Dotfiles are the configuration files that make your OS and tools do their magic. They are typically hidden, found in your home folder, and start with a `.` - thus they are called `Dotfiles`.

## Usage

```bash
# Install Personal dotfiles
bash <(curl -s https://raw.githubusercontent.com/justintime50/dotfiles/master/src/personal/install.sh)

# Install EasyPost dotfiles
bash <(curl -s https://raw.githubusercontent.com/justintime50/dotfiles/master/src/easypost/install.sh)
```

### EasyPost git config (per repo)

Add the following to the `config` file in each EasyPost repo.

```bash
[user]
	email = jhammond@easypost.com
	name = Justin Hammond
```

## Roadmap

- Syncing between machines
