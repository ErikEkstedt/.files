# Apple Magic Keyboard on Linux


Follow instructions for [hid-apple-patched](https://github.com/free5lot/hid-apple-patched)


## Works when keyboard is connected through usb

## Bluetooth Reads hid-generic instead of hid-apple
* Using the bluetooth version it uses the wrong settings [issue](https://github.com/free5lot/hid-apple-patched/issues/48)
  - [comments on AUR](https://aur.archlinux.org/packages/hid-apple-patched-git-dkms/#comment-702311)
  - "I noticed that the hid-ids.h specifies an ID for the keyboard (0x0267)"
  - `lsusb` to display ID on usb devices (when plugged in keyboard is visible)
  - When using bluetooth the keyboard is not listed (unde usb devices)
  - `dmesg` shows that the bluetooth keyboard uses hid-generic

  example on usb connect
```bash
[  146.306088] input: Apple Inc. Magic Keyboard as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.1/0003:05AC:0267.000A/input/input29
[  146.366836] apple 0003:05AC:0267.000A: input,hiddev5,hidraw8: USB HID v1.10 Keyboard [Apple Inc. Magic Keyboard] on usb-0000:00:14.0-1/input1
[  146.367270] apple 0003:05AC:0267.000B: hiddev6,hidraw9: USB HID v1.10 Device [Apple Inc. Magic Keyboard] on usb-0000:00:14.0-1/input2
```

example on BT connect
TODO
```bash
TODO: put dmesg output when bluetooth here
```



The "><|" does not display correct characters by default (swedish keyboard) 
- Fix: `setxkbmap -option apple:badmap`

KDE
- Change config options in $HOME/.config/kxbrc
- instead of manually typing the line add this option to kxbrc
- e.g: `Options=caps:escape,apple:badmap`


Instruction for fix on arch and distros sourcing the xinitrc files etc
- write the line above in your ~/.xinitrc file (Create one if needed)
