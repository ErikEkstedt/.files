# ability to kill finder
defaults write com.apple.finder QuitMenuItem -bool true; killall Finder

# Accelerated playback when adjusting the window size (Cocoa applications).

defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# The keyboard react faster to keystrokes (not equally useful for everyone

defaults write NSGlobalDomain KeyRepeat -int 1

defaults write NSGlobalDomain InitialKeyRepeat -int 12

