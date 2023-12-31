#!/bin/bash

fonts_list=(
	DejaVuSansMono
	JetBrainsMono
	FiraCode
	Mononoki
	SourceCodePro
)

# Get target root directory
if [[ $(uname) == 'Darwin' ]]; then
	echo "Use brew to install fonts. See $(nerdfonts_brew.bash)"
	exit
fi

font_dir="$HOME/.local/share/fonts"
mkdir -p $font_dir
cd $font_dir

url="https://github.com/ryanoasis/nerd-fonts/releases/latest/download"
for font in "${fonts_list[@]}"; do
	curl -OL "$url/$font.tar.xz"
	mkdir -p $font_dir/$font
	tar -xf $font.tar.xz -C $font_dir/$font
	rm $font.tar.xz
done

fc-cache -vf "$font_dir"
exit
