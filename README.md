# DotFiles

## Installation

1. Clone repo

```bash
cd ~ && git clone https://github.com/ErikEkstedt/.files.git
```

2. Install packages

```bash
xargs -a packages_linux.txt sudo apt-get install -y
```

3. Install by symlink through `stow` (`sudo apt-get install stow`)

```bash
stow */  # Everything except README
```

4. Single link

```bash
stow zsh
```

## Random

1. Generate ssh keys

- `ssh-keygen -t rsa -b 4096`

2. Set the http git repo to ssh

- `git remote set-url origin git@github.com:ErikEkstedt/.files.git`

## Information

#### Vscode

```bash
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false              # For VS Code
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false      # For VS Code Insider
defaults write com.vscodium ApplePressAndHoldEnabled -bool false                      # For VS Codium
defaults write com.microsoft.VSCodeExploration ApplePressAndHoldEnabled -bool false   # For VS Codium Exploration users
defaults delete -g ApplePressAndHoldEnabled                                           # If necessary, reset global default
```
