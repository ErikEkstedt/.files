import pyaudio
import wave

# chunk_time = 0.02
# chunk_size = int(chunk_time * sample_rate)
sample_width = 2
sample_rate = 48000  # Record at 44100 samples per second
chunk_size = 1024
# channels = 2  # Number of audio channels

p = pyaudio.PyAudio()


device_name = "pulse_source_2"
device_index = None
for i in range(p.get_device_count()):
    info = p.get_device_info_by_index(i)
    if info["name"] == device_name:
        device_index = i
        break


file = "soundsample.wav"
file = "/home/erik/.files/audio/10_49_49_Hello_there_I_sr-48000.wav"
wf = wave.open(file, "rb")

print("channels:     ", wf.getnchannels())
print("sample_width: ", wf.getsampwidth())
print("sample_rate:  ", wf.getframerate())

stream = p.open(
    format=p.get_format_from_width(wf.getsampwidth()),
    channels=wf.getnchannels(),
    rate=wf.getframerate(),
    output=True,
    output_device_index=device_index,
)
input()

data = wf.readframes(chunk_size)
while data != "":
    stream.write(data)
    data = wf.readframes(chunk_size)

stream.close()
p.terminate()

# import pyaudio
# import wave
# import sys

# CHUNK = 1024

# file = "soundsample.wav"
# wf = wave.open(file, "rb")

# # instantiate PyAudio (1)
# p = pyaudio.PyAudio()

# # find audio_sink_2 index
# device_index = None
# for i in range(p.get_device_count()):
#     info = p.get_device_info_by_index(i)
#     if info["name"] == "pulse_source_2":
#         device_index = i
#         break

# print("device_index: ", device_index)
# print(info)

# # open stream (2)
# stream = p.open(
#     format=p.get_format_from_width(wf.getsampwidth()),
#     # channels=wf.getnchannels(),
#     channels=2,
#     rate=wf.getframerate(),
#     output=True,
#     output_device_index=device_index,
# )

# # read data
# data = wf.readframes(CHUNK)

# # play stream (3)
# while len(data) > 0:
#     stream.write(data)
#     data = wf.readframes(CHUNK)

# # stop stream (4)
# stream.stop_stream()
# stream.close()

# # close PyAudio (5)
# p.terminate()
