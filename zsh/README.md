# ZSH

My ZSH-settings

I don't know how to this automatically b/c of restart but install zsh.
```bash
sudo apt-get install zsh -y
```

Then link the config and change the shell
```bash
ln -sf ~/.files/zsh/zshrc ~/.zshrc
sudo -u erik chsh -s $(which zsh)
```
