# Apple Magic Keyboard on Linux


Follow instructions for [hid-apple-patched](https://github.com/free5lot/hid-apple-patched)


## Required on KDE-NEON 20.04

* create the file `/etc/depmod.d/hid-apple.conf` with the content
  *  `override hid-apple * extra`


-------------------


From the README in [hid-apple-patched](https://github.com/free5lot/hid-apple-patched)


Note about installation on Mint and some others distros DKMS config of this repo has option
DEST_MODULE_LOCATION set to /extra. That's the place compiled patched module will be placed.
Distributions like Ubuntu, Fedora, Suse and some others ignore this parameter and use the proper
distribution-specific directory instead. There will be no issues with these distributions. Other
distributions like Mint can use DEST_MODULE_LOCATION and may require an extra configuration file to
be created by the user to force the use of patched version of hid-apple from /extra instead of
original one. In this case a new file /etc/depmod.d/hid-apple.conf should be created which tells
depmod to prefer the module in /extra (see man 5 depmod.d):

```
override hid-apple * extra
```


# Debug

- `lsusb` to display ID on usb devices (when plugged in keyboard is visible)
- `dmesg` shows that the bluetooth keyboard uses hid-generic


## Bluetooth Reads hid-generic instead of hid-apple
* Using the bluetooth version it uses the wrong settings [issue](https://github.com/free5lot/hid-apple-patched/issues/48)
  - [comments on AUR](https://aur.archlinux.org/packages/hid-apple-patched-git-dkms/#comment-702311)
  - "I noticed that the hid-ids.h specifies an ID for the keyboard (0x0267)"
  - When using bluetooth the keyboard is not listed (unde usb devices)


# Not longer relevant
The "><|" does not display correct characters by default (swedish keyboard) 
- Fix: `setxkbmap -option apple:badmap`

KDE
- Change config options in $HOME/.config/kxbrc
- instead of manually typing the line add this option to kxbrc
- e.g: `Options=caps:escape,apple:badmap`


Instruction for fix on arch and distros sourcing the xinitrc files etc
- write the line above in your ~/.xinitrc file (Create one if needed)
