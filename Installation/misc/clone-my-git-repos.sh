#!/bin/bash

cd ~

echo "Do you wish to clone Blog? (y/n)"
read answer
if [[ $answer == 'y' || $answer == 'Y'   ]]; then
	git clone git@github.com:ErikEkstedt/blog.git
fi

echo "Do you wish to clone PhD? (y/n)"
read answer
if [[ $answer == 'y' || $answer == 'Y'   ]]; then
	git clone git@github.com:ErikEkstedt/phd.git
fi


echo "Do you wish to clone .personal ? (y/n)"
read answer
if [[ $answer == 'y' || $answer == 'Y'   ]]; then
	git@github.com:ErikEkstedt/.personal.git
fi

echo "Do you wish to clone LatexDocs? (y/n)"
read answer
if [[ $answer == 'y' || $answer == 'Y'   ]]; then
	git@github.com:ErikEkstedt/LatexDocs.git
fi
