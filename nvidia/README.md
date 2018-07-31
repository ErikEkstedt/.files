# NVIDIA


## Identify Graphic Card


Run this command to see what display cards are present
```bash
sudo lshw -C display
```

If the command above does not give useful data run this:
```bash
sudo update-pciids
```

... and then:
```bash
lspci -nn | grep '\[03'
```

## Install Drivers


[Websiteforstudents Guide](https://websiteforstudents.com/install-proprietary-nvidia-gpu-drivers-on-ubuntu-16-04-17-10-18-04/)

Add repository and update
```bash
sudo add-apt-repository ppa:graphics-drivers/ppa && sudo apt update
```

Install nvidia-\* (use tab to see choices)

```bash
sudo apt install nvidia-396-dev
```

## Reboot Computer
