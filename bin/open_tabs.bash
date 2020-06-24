#!/bin/bash

# Takes input argument (urls) of variable length and opens a new firefox window with
# the tabs of the input urls.

# processrunning=$(pgrep -i $BROWSER)
# if [ $processrunning != "" ]; then
#   echo $process "is running."
#   $BROWSER --new-window $url
# else
#   echo $process "is NOT running."
#   $BROWSER &
# fi

echo "Opening tabs in new $BROWSER window..."
$BROWSER --new-window $@
