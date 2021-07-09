#!/bin/bash
# put this folder in oni's extensions folder.

prg=oni
case `uname` in
    Darwin)
        if ! [ -x "$(command -v $prg)" ]; then
            echo "Installing $prg" >&2
            echo "bred update && brew cask install oni"
            brew update
            brew cask install oni
        else
            echo "$prg is already installed" >&2
            sudo cp -r ~/.files/oni/theme-monokai /Applications/oni.app/Contents/Resources/app/extensions
        fi

        ;;
    Linux)
        sudo cp -r ~/.files/oni/theme-monokai /opt/Oni/resources/app/extensions
        ;;
esac

