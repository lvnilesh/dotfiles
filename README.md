# dotfiles

Personal dotfiles for macOS that give your machine personality.

## Requirements

Install Homebrew (will prompt to install Xcode Command Line Tools):

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Installation

```sh
git clone git@github.com:lvnilesh/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
scripts/setup
```

## What's Included

- **Packages**: [Brewfile](brew/Brewfile) with brew packages, casks, and Mac App Store apps
- **Shell**: [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh) with [Powerlevel10k](https://github.com/romkatv/powerlevel10k) prompt
- **Dotfiles**: Symlinked via [rcm](https://github.com/thoughtbot/rcm)
- **macOS**: Sensible [defaults](macos/defaults) configuration
- **Syntax Highlighting**: `grc` colorizes output for docker, curl, make, and more
- **File Associations**: [duti](https://github.com/moretension/duti) sets default apps for file types

## Post-Install

Customize the Powerlevel10k prompt:

```sh
p10k configure
```

## Structure

```
~/.dotfiles/
├── brew/           # Homebrew Brewfile (packages, casks, MAS apps)
├── chrome/         # Chrome extensions (self-hosted)
├── macos/          # macOS defaults, automounts, captured state
├── packages/       # Dotfiles (symlinked to ~ via rcm)
│   ├── zshrc       # Main zsh config
│   ├── zsh/        # Modular zsh configuration
│   ├── gitconfig   # Git configuration
│   └── tmux.conf   # Tmux configuration
├── scripts/        # Setup and utility scripts
└── vscode/         # VS Code extensions list
```
