import pyaudio
import wave
import time

sample_width = 2
sample_rate = 48000  # Record at 44100 samples per second
chunk_time = 0.01
chunk_size = int(chunk_time * sample_rate)
channels = 1  # Number of audio channels

time_in_seconds = 3
filename = "soundsample.wav"

print("sample_rate: ", sample_rate)
print("chunk_time: ", chunk_time)
print("chunk_size: ", chunk_size)
print("channels: ", channels)

p = pyaudio.PyAudio()

for i in range(p.get_device_count()):
    info = p.get_device_info_by_index(i)
    for k, v in info.items():
        print(f"{k}: {v}")
    print("-" * 50)
    input()


# find bypass index
bypass_index = None
for i in range(p.get_device_count()):
    info = p.get_device_info_by_index(i)
    if info["name"] == "Bypass":
        bypass_index = i
        break

for k, v in p.get_device_info_by_index(bypass_index).items():
    print(f"{k}: {v}")

# find audio_sink_2 index
bypass_index = None
for i in range(p.get_device_count()):
    info = p.get_device_info_by_index(i)
    if info["name"] == "pulse_sink_2":
        bypass_index = i
        break

for k, v in p.get_device_info_by_index(bypass_index).items():
    print(f"{k}: {v}")

frames = []


def stream_callback(in_data, frame_count, time_info, status):
    # print("frame_count: ", frame_count)
    # print("status: ", status)
    # print("in_data: ", len(in_data))
    frames.append(in_data)
    return (in_data, pyaudio.paContinue)


# Open a Stream with the values we just defined
stream = p.open(
    format=p.get_format_from_width(sample_width),
    channels=channels,
    rate=sample_rate,
    frames_per_buffer=chunk_size,
    input_device_index=bypass_index,
    input=True,
    output=False,
    stream_callback=stream_callback,
)
print("Stream open")
# input("\nStart recording?")
time.sleep(3)

# Stop and close the Stream and PyAudio
stream.stop_stream()
stream.close()
p.terminate()
print("-----Finished Recording-----")

# Store data in chunks for 3 seconds
# frames = []  # Initialize array to store frames
# n_frames = int(fs / chunk * time_in_seconds)
# print("n frames: ", n_frames)
# for i in range(0, n_frames):
#     data = stream.read(chunk)
#     print(data)
#     # frames.append(data)


# Open and Set the data of the WAV file
file = wave.open(filename, "wb")
file.setnchannels(channels)
file.setsampwidth(sample_width)
file.setframerate(sample_rate)
# Write and Close the File
file.writeframes(b"".join(frames))
file.close()
