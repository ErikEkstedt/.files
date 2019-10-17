# Tmux


TODO

Useful commands
* Starting tmux on a remote server may cause the session to end when ssh disconnects
```bash
systemd-run --scope --user tmux
```


## Install newer tmux:
* [libevent](https://www.howtoinstall.co/en/ubuntu/trusty/libevent-2.0-5)
  - `sudo apt-get install libevent-2.0-5`
* ncurses ([instructions](https://www.cyberciti.biz/faq/linux-install-ncurses-library-headers-on-debian-ubuntu-centos-fedora/))
  - `sudo apt-get install libncurses5-dev libncursesw5-dev`

