# Tmux


TODO

Useful commands
* Starting tmux on a remote server may cause the session to end when ssh disconnects
  - use systemd
  - Following [arclinux post](https://bbs.archlinux.org/viewtopic.php?id=247292)
  - copy the file `tmux@.service` to `~/.config/systemd/user`
  - run `systemctl --user enable tmux@.service`
  - now tmux starts a session with the username as the session-name (see `tmux@.service`)


## Install newer tmux:
* [libevent](https://www.howtoinstall.co/en/ubuntu/trusty/libevent-2.0-5)
  - `sudo apt-get install libevent-2.0-5`
* ncurses ([instructions](https://www.cyberciti.biz/faq/linux-install-ncurses-library-headers-on-debian-ubuntu-centos-fedora/))
  - `sudo apt-get install libncurses5-dev libncursesw5-dev`

