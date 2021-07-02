# Ardour

* [ardour6](https://viktorsmari.github.io/2020/06/22/build-ardour6-on-ubuntu20.html)
* [another](https://www.addictivetips.com/ubuntu-linux-tips/install-ardour-audio-editor-linux/)


##### Clone Ardour

```bash
git clone https://github.com/ardour/ardour
```

##### Install Dependencies
```bash
sudo apt install -y \
libboost-all-dev gcc g++ pkg-config libasound2-dev libgtk2.0-dev \
libsndfile1-dev libcurl4-nss-dev libarchive-dev liblo-dev libtag1-dev \
vamp-plugin-sdk librubberband-dev libfftw3-dev libaubio-dev libxml2-dev \
lv2-dev libserd-dev libsord-dev libsratom-dev liblilv-dev libgtkmm-2.4-dev
```


```bash
sudo apt-get install -y \
libglibmm-2.4-dev libusb-1.0-0-dev libpangomm-1.4-dev libsamplerate0-dev \
libcunit1-dev libcppunit-dev libudev-dev libserd-0-0 libcwiid-dev \
libxwiimote-dev libwebsocketpp-dev libwebsockets-dev \
libsratom-0-0 liblrdf0 liblrdf0-dev libsuil-dev
```

##### Install Ardour

This requres sudo to install (files in /usr/share i believe... you get an error can easily check the paths...)

But it takes time to build so just do it with sudo

```bash
sudo ./waf configure
sudo ./waf
sudo ./waf install
```

As per the instructions on the second source:


Use the CD command to move to where the output of the build is.

```
cd gtk2_ardour
```

From there, start Ardour with “ardev”.

```
./ardev
```
From this point on, the Ardour audio editor is portable (provided the PC you move the builds to has all the required files to run it). Feel free to take the source and put it on a flash drive. Alternatively, install the software on your Linux PC by running the following command in the terminal.
