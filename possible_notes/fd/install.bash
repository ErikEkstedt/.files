#! /bin/bash

prg=fd
if ! [ -x "$(command -v $prg)" ]; then
    echo "Installing fd..."
    case `uname` in
        Darwin)
            brew install fd
            ;;
        Linux)
            GIT_URL=https://github.com
            RELEASE_URL=$GIT_URL/sharkdp/fd/releases
            LATEST_RELEASE=$(curl -L -s -H 'Accept: application/json' $RELEASE_URL/latest) # find latest tags
            TAG=$(echo $LATEST_RELEASE | sed -e 's/.*"tag_name":"\([^"]*\)".*/\1/')
            TAG=$(echo $RELEASE_URL/$TAG)  # complete tag url e.g: https://github.com/sharkdp/fd/releases/tag/v8.1.1
            tag_page=$(curl -s $TAG | grep "amd64.deb") # look for correct file line
            FILE=$(echo $tag_page | sed -e 's/.*href="\([^"]*\)".*/\1/g') # substitute everything before and after url
            DOWNLOAD_URL=$GIT_URL$FILE #combine path with github base
            FILENAME=$(basename $DOWNLOAD_URL)
            echo $FILENAME
            # Download release
            wget $DOWNLOAD_URL
            # Install
            sudo dpkg -i $FILENAME
            # remove .deb
            rm $FILENAME
            ;;
    esac
else
    echo "fd already installed."
fi
