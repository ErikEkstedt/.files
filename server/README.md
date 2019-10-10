# Server


[ask ubuntu](https://askubuntu.com/questions/859630/how-to-start-ubuntu-in-console-mode)

edit lines in /etc/default/grub (requires sudo)

```bash
GRUB_CMDLINE_LINUX_DEFAULT="text"
GRUB_TERMINAL=console
```

After saving changes you need to run:

```bash
sudo update-grub
sudo systemctl enable multi-user.target --force
sudo systemctl set-default multi-user.target
```

Undoing text-mode

```bash
sudo systemctl enable graphical.target --force
sudo systemctl set-default graphical.target
```

