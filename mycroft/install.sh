#!/bin/bash


# Download repository
# run `start-mycroft.sh` or `start-mycroft.sh debug`


echo "Clone mycroft repo to ~/mycroft-core? (y/n)"
read answer
if [[ $answer == 'y' || $answer == 'Y'   ]]; then
  cd ~
  git clone https://github.com/MycroftAI/mycroft-core.git
  cd mycroft-core
  bash dev_setup.sh
fi

echo "Clone Erik skill? (y/n)"
read answer
if [[ $answer == 'y' || $answer == 'Y'   ]]; then
  cd ~
  git clone git@github.com:ErikEkstedt/mycroft-test-skill.git
fi
