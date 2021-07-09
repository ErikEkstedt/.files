# NVIDIA on Ubuntu 18.04

Nvidia/CUDA on Ubuntu that works for deep learning as well as Steam. Steam requires 32bit drivers to
work ([steam thread](https://github.com/ValveSoftware/steam-for-linux/issues/5778)). Installing graphics from ppa/ubuntu-drivers will only install either 64bit or 32bit drivers
not both (at least for nvidia-driver-440 and CUDA 10.2 when they were new).

1. Purge all nvidia
2. Go to [Cuda-downloads](https://developer.nvidia.com/cuda-downloads) and get appropriate .run
   installer

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

## Nvidia .run installation

```bash
# get rid of the packaged thingies
sudo apt purge nvidia\*
sudo apt purge libnvidia\*
sudo apt purge cuda\*
```

* Go to CUDA official download (e.g CUDA toolkit 10.2) and download the local .run file
    1. download:
        ```bash
        wget http://developer.download.nvidia.com/compute/cuda/10.2/Prod/local_installers/cuda_10.2.89_440.33.01_linux.run
        ```
    2. Disable the Nouveau drivers:
        - Create a file at /etc/modprobe.d/blacklist-nouveau.conf with the following contents:
            ```bash
            blacklist nouveau
            options nouveau modeset=0
            ```
        - Regenerate the kernel initrd: `sudo /sbin/mkinitrd`
        - Restart (might be low resolution)
    3. run: `sudo sh cuda_10.2.89_440.33.01_linux.run`
    4. Restart

> Please make sure that
>  -   PATH includes /usr/local/cuda-10.2/bin
>  -   LD_LIBRARY_PATH includes /usr/local/cuda-10.2/lib64, or, add /usr/local/cuda-10.2/lib64 to /etc/ld.so.conf and run ldconfig as root

TESTS
* run `python pytorch_test.py` from this folder
* run `nvidia-smi`
* Check if steam works

## Graphics driver ppa


**WARNING**

When install through ppa only one of 64bit or 32bit is installed. That is `sudo apt-get install nvidia-driver-440` and `sudo apt-get install libnvidia-gl-440` works fine. However, installing `sudo apt-get install libnvidia-gl-440:i386` then changes to 32bit and libnvidia-gl-440 does not work.

this [steam thread](https://github.com/ValveSoftware/steam-for-linux/issues/5778) states that only
the `.run` installation from nvidia works for both versions.

---------------------

#### Installation
* Add ppa graphics drivers
    ```bash
    sudo add-apt-repository ppa:graphics-drivers
    sudo apt-get update
    ```
* Check which drivers are available `ubuntu-drivers list`
* Install
  * `sudo ubuntu-drivers install`
  * Install the driver of choice `sudo apt-get install nvidia-driver-VERSION`
  * `sudo apt-get install nvidia-driver-440`
  * `sudo apt-get install libnvidia-gl-440`
  * `sudo apt-get install libnvidia-gl-440:i386`

* Check installation (for version 440). 
    - `apt-cache policy nvidia-driver-440`
    - `apt-cache policy libnvidia-gl-440`
    - `apt-cache policy libnvidia-gl-440:i386`


