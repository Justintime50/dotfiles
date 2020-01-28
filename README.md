# Dotfiles

My personal dotfiles. Everyone else is doing it, why not me?

Dotfiles are the configuration files that make your OS do magic. They are typically hidden folder starting with a `.` - thus they are called Dotfiles.

## Usage

Download and replace default configuration files.

```bash
# Copy EasyPost dotfiles
cp -a src/easypost/. $HOME

# Copy Personal dotfiles
cp -a src/personal/. $HOME
```

### EasyPost git config (per repo)

Add the following to the repo in each `config` file in an EasyPost repo.

```bash
[user]
	email = jhammond@easypost.com
	name = Justin Hammond
```

## Roadmap

- Automated installation
- Syncing between machines
