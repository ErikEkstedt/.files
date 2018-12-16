#!/bin/bash

# Takes input argument (urls) of variable length and opens a new firefox window with
# the tabs of the input urls.
# As of now an instance of firefox needs to run

echo "Opening tabs in new Firefox window:"
count=true

# Ugly verbose
# process="Firefox"
# processrunning=$(pgrep -i $process)
# if [ $processrunning != "" ]; then
#   echo $process "is running."
#   firefox --new-window $url
# else
#   echo $process "is NOT running."
#   firefox &
# fi


for url in "$@"; do
  if [ $count = true ]; then
    count=false
    firefox --new-window $url
    sleep 0.2  # needs some time to execute correctly
  else
    firefox --new-tab $url
  fi
done
