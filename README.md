# Dotfiles

My personal dotfiles. Everyone else is doing it.

Dotfiles are the configuration files that make your OS and tools do their magic. They are typically hidden files starting with a `.` - thus they are called Dotfiles.

## Usage

Replace default configuration files by running the following:

```bash
# Install EasyPost dotfiles
bash <(curl -s https://raw.githubusercontent.com/justintime50/dotfiles/master/src/easypost/install.sh)

# Install Personal dotfiles
bash <(curl -s https://raw.githubusercontent.com/justintime50/dotfiles/master/src/personal/install.sh)
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
