# ZSH

My ZSH-settings

I don't know how to this automatically b/c of restart but install zsh.
```bash
sudo apt-get install zsh -y
```

```bash
sudo -u $USER chsh -s $(which zsh)
```

Run `stow zsh` from `$DOTFILES` to only symlink the zsh-settings.
