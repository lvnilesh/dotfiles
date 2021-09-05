# dotfiles

dotfiles that give your computer personality.

## Motivation

https://github.com/ruimarinho/dotfiles


## Requirements

Just install Homebrew which will prompt you to install *Command Line Tools (CLT) for Xcode*.

  ```
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```

The rest of the utilities will be provided by Homebrew when sourcing the bundled Brewfile.

## Features

* Installs my most used [brew packages, casks and mas apps](brew/Brewfile).
* Installs [oh-my-zsh](https://github.com/zimfw/zimfw), a zsh configuration framework
* Symlinks dotfiles to home dir via [rcm](https://github.com/thoughtbot/rcm), arguably the best dotfile manager in existence.
* Configures a number of macOS [defaults](macos/defaults) to fit my needs and personal taste.
* Enables highlighting via `grc` for several binaries, such as docker, curl, make and many others. Beautiful colors, everywhere.
* Configures default handlers and applications configuration for certain file types with [duti](https://github.com/moretension/duti) (e.g. `.md`, `.json`, `.yml`).


## Usage

1. Download or clone this repository.

```
git clone https://github.com/lvnilesh/dotfiles.git ~/.dotfiles
```

2. Run `scripts/setup`

Feel free to clone or fork this setup. These dotfiles have been heavily inspired over the years by many others in the open source community, to whom I am grateful for.
