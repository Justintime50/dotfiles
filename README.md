# Dotfiles

My personal dotfiles. Everyone else is doing it.

Dotfiles are the configuration files that make your OS do magic. They are typically hidden files starting with a `.` - thus they are called Dotfiles.

## Usage

Clone this repo and replace default configuration files.

```bash
# Copy EasyPost dotfiles
src/easypost/install.sh

# Copy Personal dotfiles
src/personal/install.sh
```

### EasyPost git config (per repo)

Add the following to the `config` file in each EasyPost repo.

```bash
[user]
	email = jhammond@easypost.com
	name = Justin Hammond
```

## Roadmap

- Automated installation
- Syncing between machines
