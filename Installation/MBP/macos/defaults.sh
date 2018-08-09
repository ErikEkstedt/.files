# ability to kill finder
defaults write com.apple.finder QuitMenuItem -bool true; killall Finder

# Accelerated playback when adjusting the window size (Cocoa applications).
echo "Adjusting window animation is accelerated"
echo "> defaults write NSGlobalDomain NSWindowResizeTime -float 0.001 "
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

echo "Faster keyboard keystrokes and faster keyrepeat"
echo
echo "> defaults write NSGlobalDomain KeyRepeat -int 1"
defaults write NSGlobalDomain KeyRepeat -int 1

echo
echo "> defaults write NSGlobalDomain InitialKeyRepeat -int 12"
defaults write NSGlobalDomain InitialKeyRepeat -int 12


echo
echo "Set default screen shot location to ~/Pictures"
echo "> defaults write com.apple.screencapture location ~/Pictures"
defaults write com.apple.screencapture location ~/Pictures
