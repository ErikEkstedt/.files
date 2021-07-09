# sleep 3
# pacmd set-default-sink jack_out
# pacmd set-default-source jack_in
sleep 2
pactl load-module module-jack-sink client_name=pulse_sink_2 channels=2 connect=no
pactl load-module module-jack-source client_name=pulse_source_2 channels=2 connect=no
sleep 2
alsa_in -j HeadsetMic -d hw:CARD=S7 -r 44100 >/dev/null &
alsa_out -j HeadsetOut -d hw:CARD=S7 -r 44100 channels=2 >/dev/null &
