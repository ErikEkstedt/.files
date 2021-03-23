# Audio on Linux


* Go here to enable the [repositories](https://kx.studio/Repositories)
  * don't forget `sudo apt-get update`
* jack2
  * [real-time scheduling](https://jackaudio.org/faq/linux_rt_config.html) with `audio` groups
  * real-time scheduling 
  * Is the user in the audio groups? type `groups` to check
    * if not -> `sudo groupadd audio` to create audio group. No problem if it already exists
    * add the group to the user `sudo usermod -a -G audio YOUR_USERNAME_HERE`

    
    
## Capture output as input?

* [routing Alsa](https://jackaudio.org/faq/routing_alsa.html)
  * requires ALSA plugin that is **not** installed
  * debian: `sudo apt-get install libasound2-plugins`
* ALSA loopback [Jack and loopback device as Alsa-to-jack_bridge](https://alsa.opensrc.org/Jack_and_Loopback_device_as_Alsa-to-Jack_bridge)
  * check if `snd-aloop` is installed by `sudo modinfo snd-aloop` and if you see output you have it.
  * load the loopback virtual soundcard. Shut down all audio apps.
    * `sudo alsa force-unload`
    * `sudo modprobe snd-aloop`

        

## sources

* [Video](https://www.youtube.com/watch?v=4c278l-jyqA) on jack and pulseaudio-module and custom sink/source
* jack+pulse audio on [askubuntu](https://askubuntu.com/questions/572120/how-to-use-jack-and-pulseaudio-alsa-at-the-same-time-on-the-same-audio-device)
