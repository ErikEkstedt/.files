# Audio



```bash
alsa_in -j HeadsetMic -d hw:CARD=S7 -r 44100 >/dev/null &
alsa_out -j HeadsetOut -d hw:CARD=S7 -r 44100 channels=2 >/dev/null &
```


--------------------------------------

# OLD

Gather audio info (taken from `possible_notes/audio`) in one place.

--------------------------------------
Afterload.sh
```bash
# sleep 3
# pacmd set-default-sink jack_out
# pacmd set-default-source jack_in
sleep 2
pactl load-module module-jack-sink client_name=pulse_sink_2 channels=2 connect=no
pactl load-module module-jack-source client_name=pulse_source_2 channels=2 connect=no
sleep 2
alsa_in -j HeadsetMic -d hw:CARD=S7 -r 44100 >/dev/null &
alsa_out -j HeadsetOut -d hw:CARD=S7 -r 44100 channels=2 >/dev/null &
```


--------------------------------------

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
