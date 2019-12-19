#  LF - File Manager


[lf](https://github.com/gokcehan/lf) is like [ranger](https://github.com/ranger/ranger) but written
in go instead of python, relies on more on shell commands. LF is faster(?) and more barebones.


## Install

**MACOSX**
* brew install lf

**Linux**
* [Releases](https://github.com/gokcehan/lf/releases)
    * download, extract and run
* Source
  * install go `sudo apt-get install golang`
  *  `go get -u github.com/gokcehan/lf`

Run `link_configs.sh` to create folder `$HOME/.config/lf` and link `lfrc` -> `$HOME/.config/lf/lfrc`

```bash
./link_configs.sh
```







