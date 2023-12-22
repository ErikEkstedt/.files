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
