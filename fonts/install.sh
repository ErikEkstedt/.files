#!/bin/bash

# Downloads fonts from nerfont and extracts them to $FontRoot

FontRoot=~/.local/share/fonts

echo "Creating directory $FontRoot"
mkdir -p $FontRoot

cd $FontRoot
fonts=(Meslo DejaVuSansMono FiraCode Mononoki)
url=https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/
ext=.zip
for font in "${fonts[@]}"; do
  echo "Download $font"
  curl -fLO $url$font$ext
  echo "Download complete!"
  echo "Extracting fonts!"
  unzip $font$ext -d $font
  echo "Removing zip!"
  rm $font$ext
done

echo "Refreshing Fonts"
fc-cache -vf

echo
echo "Done!"